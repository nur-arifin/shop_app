import 'package:json_annotation/json_annotation.dart';

part 'cart_payment.g.dart';

@JsonSerializable()
class CartPayment {
  String? product_id;
  String? product_name;
  String? image;
  int? quantity;
  double? sub_total;
  double? unit_price;

  CartPayment();

  factory CartPayment.fromJson(Map<String, dynamic> json) =>
      _$CartPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$CartPaymentToJson(this);
}
