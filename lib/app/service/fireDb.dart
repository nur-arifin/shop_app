import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shop_app/app/modules/banner/model/banner_m.dart';
import 'package:shop_app/app/modules/category/model/category_m.dart';
import 'package:shop_app/app/modules/payment/model/payment_m.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:uuid/uuid.dart';

class FireDb {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ProductModel>> productStream() {
    return _firestore
        .collection('products')
        .orderBy('id')
        .snapshots()
        .map((QuerySnapshot query) {
      var retVal = <ProductModel>[];
      query.docs.forEach((element) {
        retVal.add(ProductModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<BannerModel>> bannerStream() {
    return _firestore
        .collection('banner')
        .snapshots()
        .map((QuerySnapshot query) {
      var retVal = <BannerModel>[];
      query.docs.forEach((element) {
        retVal.add(BannerModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Stream<List<CategoryModel>> categoryStream() {
    return _firestore
        .collection('category')
        .snapshots()
        .map((QuerySnapshot query) {
      var retVal = <CategoryModel>[];
      query.docs.forEach((element) {
        retVal.add(CategoryModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> addToFireDb(
    List product,
    String total,
    deliver,
    payment,
    note,
  ) async {
    try {
      var id = Uuid().v1();
      await _firestore.collection('payment').doc(id).set({
        'idOrder': id,
        'delivery': deliver,
        'total': total,
        'note': note,
        'user': '1',
        'payment': payment,
        'createdAt': DateTime.now(),
        'arrived': false,
        'payment_image':'',
        'cart': product
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<PaymentModel>> paymentStream() {
    return _firestore
        .collection('payment')
        .orderBy('createdAt', descending: true)
        // .where('user', isEqualTo: '1')
        .snapshots()
        .map((QuerySnapshot query) {
      var retVal = <PaymentModel>[];
      query.docs.forEach((element) {
        retVal.add(PaymentModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<String?> checkPayment(croppedFile, idOrder) async {
    try {
      var imageName = 'payment';
      var filePath = 'payment/$idOrder/$imageName';
      return await FirebaseStorage.instance.ref(filePath).getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  Future paymentToStore(String image, idOrder) async {
    try {
      await _firestore
          .collection('payment')
          .doc(idOrder)
          .update({'payment_image': '$image'});
    } catch (e) {
      print(e);
    }
  }

  Future addNewPayment(croppedFile, idOrder) async {
    var imageName = 'payment';
    var filePath = 'payment/$idOrder/$imageName';

    try {
      await FirebaseStorage.instance.ref(filePath).putFile(croppedFile);
    } on FirebaseException catch (e) {
      print('upload image exception, code is ${e.code}');
      // e.g, e.code == 'canceled'
    }
  }
}
