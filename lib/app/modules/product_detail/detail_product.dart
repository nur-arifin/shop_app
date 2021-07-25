import 'package:flutter/material.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';
import 'package:shop_app/app/modules/product_detail/component/body_product.dart';
import 'package:shop_app/app/widgets/round_icon_button.dart';

class DetailProduct extends StatelessWidget {
  final ProductModel? product;

  const DetailProduct({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Column(
        children: [
          SafeArea(
            child: ListTile(
              leading: RoundedIconBtn(
                icon: Icons.chevron_left_rounded,
                press: () => Navigator.pop(context),
              ),
              trailing: Container(
                width: 70,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      '4.5',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Body(
            product: product,
          )),
        ],
      ),
    );
  }
}
