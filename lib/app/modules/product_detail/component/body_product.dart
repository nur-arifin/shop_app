import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/modules/product_detail/component/colors_dot.dart';
import 'package:shop_app/app/modules/product_detail/component/product_description.dart';
import 'package:shop_app/app/modules/product_detail/component/product_image.dart';
import 'package:shop_app/app/modules/product_detail/component/top_rounded_container.dart';
import 'package:shop_app/app/widgets/default_button.dart';

class Body extends StatelessWidget {
  final ProductModel? product;

  Body({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: Get.width * 0.15,
                            right: Get.width * 0.15,
                            bottom: 56,
                            top: 15,
                          ),
                          child: GetBuilder(builder: (CartController item) {
                            return DefaultButton(
                              text: 'Add To Cart',
                              press: item.checkItemisInCart(product!.id) != 0
                                  ? () {
                                      item.incrementFromDetailProduct(
                                          product!.id);
                                    }
                                  : () {
                                      item.addToCart(product!);
                                    },
                            );
                          })),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
