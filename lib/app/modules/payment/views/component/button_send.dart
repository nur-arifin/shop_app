import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/payment/controller/image_c.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';
import 'package:shop_app/app/widgets/default_button.dart';

class ButtonSend extends StatelessWidget {
  const ButtonSend({
    Key? key,
    this.total, this.idOrder,
  }) : super(key: key);
  final String? total,idOrder;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CartController _c) {
      return Container(
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
                      text: '\$$total',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              GetBuilder(builder: (PaymentController _c) {
                return SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: 'send payment',
                    press: () {
                      ImageController.instance
                          .cropImageFromFile()
                          .then((croppedFile) {
                        if (croppedFile != null) {
                          _c.saveUserImageToFirebaseStorage(croppedFile,idOrder);
                        } else {
                          Get.dialog(Text('Pick Image error'));
                        }
                      });
                    },
                  ),
                );
              })
            ],
          ),
        ),
      );
    });
  }
}
