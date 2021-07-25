import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? image;
  String? name;
  String? brand;
  String? description;
  double? price;

  ProductModel.fromDocumentSnapshot(
    DocumentSnapshot data,
  ) {
    id = data['id'];
    image = data['image'];
    name = data['name'];
    brand = data['brand'];
    description = data['description'];
    price = data['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    //For Json Change
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['brand'] = brand;
    data['description'] = description;
    data['price'] = price;
    return data;
  }
}
