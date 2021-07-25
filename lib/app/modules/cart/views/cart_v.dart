import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/cart/views/component/body_cart.dart';
import 'package:shop_app/app/modules/cart/views/component/checkout_cart.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyCart(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          Text(
            'Your Cart',
            style: TextStyle(color: Colors.white),
          ),
          GetBuilder(builder: (CartController _c) {
            return Text(
              '${_c.flutterCart.cartItem.length} items',
              style: TextStyle(color: Colors.white, fontSize: 12),
            );
          })
        ],
      ),
    );
  }
}
