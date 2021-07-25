import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/cart/views/component/cart_card.dart';

class BodyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CartController item) {
      return item.flutterCart.cartItem.isNotEmpty
          ? ListView.builder(
            itemCount: item.flutterCart.cartItem.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Dismissible(
                  key: Key(item.flutterCart.cartItem[index].productId.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    item.deleteItemFromCart(index);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7B5B5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Icon(
                          LineIcons.alternateTrash,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  child: CartCard(
                    index: index,
                    cart: item.flutterCart.cartItem[index],
                  )),
            ),
          )
          : Center(child: Text('Cart kosong !!'));
    });
  }
}
