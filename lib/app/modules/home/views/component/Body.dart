import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/banner/views/banner.dart';
import 'package:shop_app/app/modules/category/views/categories.dart';
import 'package:shop_app/app/modules/product/views/popular_product.dart';
import 'package:shop_app/app/modules/banner/views/special_offers.dart';

class Body extends StatelessWidget  {
  Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: 30),
          PopularProducts(),
          SizedBox(height: 30),
          DiscountBanner(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
