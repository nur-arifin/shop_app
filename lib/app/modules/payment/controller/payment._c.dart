import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/modules/cart/controller/cart.dart';
import 'package:shop_app/app/modules/home/views/home.dart';
import 'package:shop_app/app/modules/order/controller/order_c.dart';
import 'package:shop_app/app/modules/payment/model/payment_m.dart';
import 'package:shop_app/app/modules/payment/views/payment_history.dart';
import 'package:shop_app/app/service/fireDb.dart';

class PaymentController extends GetxController {
  static final OrderController _ = Get.find();
  var flutterCart = FlutterCart();
  final _storage = GetStorage();

  Rx<List<PaymentModel>> paymentList = Rx<List<PaymentModel>>([]);
  Future<List<PaymentModel>> paymentRequest() async =>
      await Future.delayed(const Duration(seconds: 1), () => paymentList.value);

  @override
  void onInit() {
    paymentList.bindStream(FireDb().paymentStream());
    super.onInit();
  }

  void addToPayment() {
    var _deliver = _.selectDelivery;
    var _payment = _.selectPayment;
    final _note = _.note.text;
    final _totalAmount = flutterCart.getTotalAmount().toString();
    final _cart = jsonDecode(jsonEncode(flutterCart.cartItem));
    if (_deliver!.isNotEmpty && _payment!.isNotEmpty) {
      FireDb().addToFireDb(_cart, _totalAmount, _deliver, _payment, _note);
      deleteAllCartProvider();
      _.selectDelivery = '';
      _.selectPayment = '';
      _.note.clear();
      Get.offAll(HomePage());
      Get.snackbar('success', 'transaction success');
    } else {
      navigator!.pop();
      _.note.clear();
      Get.snackbar('Warning', 'Select Your Choice',
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> saveUserImageToFirebaseStorage(croppedFile, idOrder) async {
    try {
      var takeImageURL = await (FireDb().checkPayment(croppedFile, idOrder));
      await FireDb().addNewPayment(croppedFile, idOrder);
      await FireDb().paymentToStore(takeImageURL!, idOrder);
      await Get.to(PaymentHistory());
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
  }

  void deleteAllCartProvider() async {
    flutterCart.deleteAllCart();
    lokaldb();
    update();
  }

  void lokaldb() async {
    try {
      final listcard = jsonEncode(flutterCart.cartItem);
      await _storage.write('cart', listcard);
    } catch (e) {
      print(e);
    }
  }
}
