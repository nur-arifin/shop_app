import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/modules/product_detail/detail_product.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  final bool? isLoading;
  ProductCard({Key? key, this.product, this.isLoading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 12.0,
                      width: 50.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 10.0,
                          width: 30.0,
                          color: Colors.grey[300],
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey[300],
                          ),
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              width: 120,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    DetailProduct(product: product),
                    duration: Duration(milliseconds: 800),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Hero(
                          tag: '${product!.id}',
                          child: CachedNetworkImage(
                            imageUrl: '${product!.image}',
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(
                              LineIcons.shoppingBag,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${product!.name}',
                      style: TextStyle(color: Colors.black),
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product!.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            print('like');
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: kSecondaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                LineIcons.heartAlt,
                                color: Colors.red,
                                size: 15,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
