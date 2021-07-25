import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';
import 'package:shop_app/app/widgets/alert.dart';
import 'package:shop_app/app/widgets/default_button.dart';

class PayCard extends StatelessWidget {
  const PayCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CartController _c) {
      return _c.flutterCart.cartItem.isNotEmpty
          ? Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -15),
                    blurRadius: 20,
                    color: Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Total:\n',
                        children: [
                          TextSpan(
                            text: '\$${_c.flutterCart.getTotalAmount()}',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    GetBuilder(builder: (PaymentController _c) {
                      return SizedBox(
                        width: 190,
                        child: DefaultButton(
                          text: 'Pay Now',
                          press: () {
                            DAlert().payDailog();
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            )
          : SizedBox();
    });
  }
}
