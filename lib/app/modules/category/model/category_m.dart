import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? image;
  String? title;

  CategoryModel.fromDocumentSnapshot(
    DocumentSnapshot data,
  ) {
    image = data['image'];
    title = data['title'];
  }
}