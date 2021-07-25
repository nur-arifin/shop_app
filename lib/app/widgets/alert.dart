import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';

class DAlert {
  final PaymentController _ = Get.find();
  void payDailog() {
    Get.defaultDialog(
        title: 'Konfirmasi!',
        content: Container(padding: EdgeInsets.all(5), child: Text('Pay Now?')),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _.addToPayment();
                },
                child: Text(
                  'Ok',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ]);
  }
}
