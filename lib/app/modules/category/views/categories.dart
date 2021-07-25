import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/category/controller/category_c.dart';
import 'package:shop_app/app/modules/category/model/category_m.dart';
import 'package:shop_app/app/modules/category/views/component/category_card.dart';

class Categories extends StatelessWidget {
  final CategoryController _c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FutureBuilder(
          future: _c.categoryRequest(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.hasData && snapshot.connectionState == ConnectionState.none) {
              return Text('Document does not exist');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final categoryItem = snapshot.data as List<CategoryModel>;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      categoryItem.length,
                      (index) {
                        var model = categoryItem[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: CategoryCard(
                            category: model,
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              );
            }

            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                        5,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: CategoryCard(
                              isLoading: true,
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20)
                    ]));
          }),
    );
  }
}
