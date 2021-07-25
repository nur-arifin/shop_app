import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/product/controller/product_c.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/widgets/section_title.dart';
import 'package:shop_app/app/modules/product/views/component/product_card.dart';

class PopularProducts extends StatelessWidget {
  final ProductController _c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(title: 'Popular Products', press: () {}),
        ),
        SizedBox(height: 20),
        FutureBuilder(
            future: _c.productRequest(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final productItem = snapshot.data as List<ProductModel>;
                  return SizedBox(
                    height: 180,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productItem.length,
                        itemBuilder: (context, index) => ProductCard(
                              product: productItem[index],
                            )),
                  );
                }
              } else if (snapshot.hasError) {
                return Text('Terjadi Kesalahan');
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      6,
                      (index) {
                        return ProductCard(isLoading: true);
                      },
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              );
            }),
      ],
    );
  }
}
