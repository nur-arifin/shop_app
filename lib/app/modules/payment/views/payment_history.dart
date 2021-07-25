import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';
import 'package:shop_app/app/modules/payment/model/payment_m.dart';
import 'package:shop_app/app/modules/payment/views/payment_detail.dart';
import 'package:timeago/timeago.dart' as timeago;

class PaymentHistory extends StatelessWidget {
  PaymentHistory({Key? key}) : super(key: key);
  final PaymentController _c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment History'),
        ),
        body: FutureBuilder(
            future: _c.paymentRequest(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Input a URL to start');
                case ConnectionState.waiting:
                  print('waiting');
                  return Text('waiting');
                case ConnectionState.active:
                  print('active');
                  return Text('active');
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    print('has Error');
                    return Text(
                      '${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var paymentItem = snapshot.data as List<PaymentModel>;
                      return paymentItem.isNotEmpty
                          ? ListView.builder(
                              itemCount: paymentItem.length,
                              itemBuilder: (context, index) {
                                var model = paymentItem[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(PaymentDetail(
                                        cartItem: model.cart,
                                        deliver: model.delivery,
                                        paymentMethode: model.payment,
                                        total: model.total,
                                        note: model.note,
                                        idOrder: model.idOrder,
                                        imageP: model.payment_image,
                                      ));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$ ${model.total}',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              timeago.format(
                                                  model.createdAt!.toDate(),
                                                  allowFromNow: true),
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ]),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(child: Text('Kosong'));
                    }
                  }
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}
