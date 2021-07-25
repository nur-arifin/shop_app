import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/order/controller/order_c.dart';

Row deliveryRadioButton(int btnIndex, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      GetBuilder(builder: (OrderController _c) {
        return Radio(
            activeColor: Colors.blue,
            value: _c.delivery![btnIndex],
            groupValue: _c.selectDelivery,
            onChanged: (value) {
              _c.deliveryRadioButton(value);
            });
      }),
      Text(title)
    ],
  );
}

Row paymentRadioButton(int btnIndex, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      GetBuilder(builder: (OrderController _c) {
        return Radio(
            activeColor: Colors.blue,
            value: _c.payment![btnIndex],
            groupValue: _c.selectPayment,
            onChanged: (value) {
              _c.paymentRadioButton(value);
              print( _c.payment![btnIndex],);
            });
      }),
      Text(title)
    ],
  );
}
