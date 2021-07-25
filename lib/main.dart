import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/app.dart';
import 'package:shop_app/app/modules/banner/controller/banner_c.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/category/controller/category_c.dart';
import 'package:shop_app/app/modules/order/controller/order_c.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';
import 'package:shop_app/app/modules/product/controller/product_c.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  Get.put<ProductController>(ProductController());
  Get.put<BannerController>(BannerController());
  Get.put<CategoryController>(CategoryController());
  Get.put<CartController>(CartController());
  Get.put<PaymentController>(PaymentController());
  Get.put<OrderController>(OrderController());
  runApp(MyApp());
}