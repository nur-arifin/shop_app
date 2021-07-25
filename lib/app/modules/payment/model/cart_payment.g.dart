// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartPayment _$CartPaymentFromJson(Map<String, dynamic> json) {
  return CartPayment()
    ..product_id = json['product_id'] as String?
    ..product_name = json['product_name'] as String?
    ..image = json['image'] as String?
    ..quantity = (json['quantity'] as num?) as int?
    ..sub_total = (json['sub_total'] as num?)?.toDouble()
    ..unit_price = (json['unit_price'] as num?)?.toDouble();
}

Map<String, dynamic> _$CartPaymentToJson(CartPayment instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'image': instance.image,
      'quantity': instance.quantity,
      'sub_total': instance.sub_total,
      'unit_price': instance.unit_price,
    };
