import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/order/controller/order_c.dart';
import 'package:shop_app/app/modules/order/views/component/orderlist_card.dart';
import 'package:shop_app/app/modules/order/views/component/radio_button.dart';

class BodyOrder extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CartController item) {
      return item.flutterCart.cartItem.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ProductList',style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      itemCount: item.flutterCart.cartItem.length,
                      itemBuilder: (context, index) => Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Container(
                          padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: OrderListCard(
                            index: index,
                            cart: item.flutterCart.cartItem[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Delivery :',style: TextStyle(fontSize: 18),),
                  ),
                  deliveryRadioButton(0, 'JNE'),
                  deliveryRadioButton(1, 'JNT'),
                  deliveryRadioButton(2, 'SiCepat'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Payment Methode :',style: TextStyle(fontSize: 18),),
                  ),
                  paymentRadioButton(0, 'Indomaret'),
                  paymentRadioButton(1, 'Tranfer Bank'),
                  paymentRadioButton(2, 'BNI'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controller.note,
                      decoration: InputDecoration(
                        labelText: 'Note',
                        hintText: 'Enter your note',
                        // If  you are using latest version of flutter then lable text and hint text shown like this
                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(child: Text('Cart kosong !!'));
    });
  }
}
