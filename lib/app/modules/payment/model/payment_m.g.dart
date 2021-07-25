// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel()
    ..arrived = json['arrived'] as bool?
    ..delivery = json['delivery'] as String?
    ..total = json['total'] as String?
    ..note = json['note'] as String?
    ..user = json['user'] as String?
    ..payment = json['payment'] as String?
    ..idOrder = json['idOrder'] as String?
    ..payment_image = json['payment_image'] as String?
    ..createdAt = json['createdAt'] as Timestamp?
    ..cart = (json['cart'] as List<dynamic>?)
        ?.map((e) => CartPayment.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'arrived': instance.arrived,
      'delivery': instance.delivery,
      'total': instance.total,
      'note': instance.note,
      'user': instance.user,
      'payment': instance.payment,
      'createdAt': instance.createdAt,
      'payment_image':instance.payment_image,
      'idOrder':instance.idOrder,
      'cart': instance.cart,
    };
