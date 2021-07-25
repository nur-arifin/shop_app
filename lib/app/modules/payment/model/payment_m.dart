import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/app/modules/payment/model/cart_payment.dart';

part 'payment_m.g.dart';

@JsonSerializable()
class PaymentModel {
  bool? arrived;
  String? delivery;
  String? total;
  String? note;
  String? user;
  String? payment;
  String? idOrder;
  String? payment_image;
  Timestamp? createdAt;
  List<CartPayment>? cart;

  PaymentModel();
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  PaymentModel.fromDocumentSnapshot(
    DocumentSnapshot data,
  ) {
    arrived = data['arrived'];
    delivery = data['delivery'];
    payment = data['payment'];
    note = data['note'];
    createdAt = data['createdAt'];
    total = data['total'];
    user = data['user'];
    idOrder = data['idOrder'];
    payment_image = data['payment_image'];
    cart = _convertCartItems(data['cart'] ?? []);
  }

  List<CartPayment> _convertCartItems(List cartFomDb) {
    var _result = <CartPayment>[];
    if (cartFomDb.isNotEmpty) {
      cartFomDb.forEach((element) {
        _result.add(CartPayment.fromJson(element));
      });
    }
    return _result;
  }
}
