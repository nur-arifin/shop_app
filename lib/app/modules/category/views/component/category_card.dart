import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_app/app/modules/category/model/category_m.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel? category;
  final GestureTapCallback? press;
  final bool? isLoading;

  const CategoryCard({Key? key, this.category, this.press, this.isLoading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? SizedBox(
            width: 55,
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 30,
                    height: 8,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 55,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.network('${category!.image}'),
                  ),
                  SizedBox(height: 5),
                  Text('${category!.title}', textAlign: TextAlign.center)
                ],
              ),
            ),
          );
  }
}
