import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String? image;
  String? title;
  String? subtitle;

  BannerModel.fromDocumentSnapshot(
    DocumentSnapshot data,
  ) {
    image = data['image'];
    title = data['title'];
    subtitle = data['subtitle'];
  }
}
