import 'package:flutter/material.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/order/views/component/body.dart';
import 'package:shop_app/app/modules/order/views/component/pay_card.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyOrder(),
      bottomNavigationBar: PayCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          Text(
            'Order NOw',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'items',
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
