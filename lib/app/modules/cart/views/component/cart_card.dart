import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/cart/model/cart_m.dart';
import 'package:shop_app/app/widgets/round_icon_button.dart';

class CartCard extends StatelessWidget {
  final int? index;
  final CartItem? cart;
  CartCard({Key? key, this.cart, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: '${cart!.image}',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cart!.productName}',
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              GetBuilder(builder: (CartController item) {
                return Row(
                  children: [
                    RoundedIconBtn(
                      icon: Icons.remove,
                      press: () {
                        item.decrementItemFromCartProvider(index!);
                      },
                    ),
                    SizedBox(width: 10),
                    Text('${item.flutterCart.cartItem[index!].quantity}'),
                    SizedBox(width: 10),
                    RoundedIconBtn(
                      icon: Icons.add,
                      showShadow: true,
                      press: () {
                        item.incrementItemToCartProvider(index!);
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                text: '${cart!.quantity}x ',
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                      text: '\$${cart!.unitPrice}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ))
                ],
              ),
            ),
            SizedBox(height: 24),
            Text.rich(
              TextSpan(
                text: 'SubTotal : \$${cart!.subTotal}',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
