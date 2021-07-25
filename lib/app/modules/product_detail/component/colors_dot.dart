import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/widgets/round_icon_button.dart';

class ColorDots extends StatelessWidget {
  ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel? product;
  final List colors = [Colors.red, Colors.green, Colors.yellow];
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    var selectedColor = 2;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ...List.generate(
            3,
            (index) => ColorDot(
              color: colors[index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: 20),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
