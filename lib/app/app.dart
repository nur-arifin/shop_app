import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/home/views/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      home: HomePage(),
    );
  }
}