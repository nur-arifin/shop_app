import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  final note = TextEditingController();
  final List<String>? delivery = ['JNE', 'JNT', 'SiCepat'];
  final List<String>? payment = ['Indomaret', 'Transfer Bank', 'BNI'];
  String? selectPayment = '';
  String? selectDelivery = '';
  void deliveryRadioButton(value) {
    selectDelivery = value;
    update();
  }

  void paymentRadioButton(value) {
    selectPayment = value;
    update();
  }
}
