import 'package:flutter/material.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/payment/model/cart_payment.dart';
import 'package:shop_app/app/modules/payment/views/component/body.dart';
import 'package:shop_app/app/modules/payment/views/component/button_send.dart';

class PaymentDetail extends StatelessWidget {
  final List<CartPayment>? cartItem;
  final String? deliver, paymentMethode, total, note, idOrder, imageP;
  const PaymentDetail({
    Key? key,
    this.cartItem,
    this.deliver,
    this.paymentMethode,
    this.total,
    this.note,
    this.idOrder,
    this.imageP,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BodyPaymentDetail(cartItem, deliver, paymentMethode, note, imageP),
      bottomNavigationBar: ButtonSend(
        total: total,
        idOrder: idOrder,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Text(
        'Payment Detail',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: () {}, child: Text('Arrived')),
        )
      ],
    );
  }
}
