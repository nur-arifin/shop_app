import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop_app/app/constans.dart';

class PaymentListCard extends StatelessWidget {
  final String? image, name;
  final int? qty;
  final double? price, subtotal;

   PaymentListCard({
    Key? key,
    this.image,
    this.name,
    this.qty,
    this.price,
    this.subtotal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                imageUrl: image.toString(),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: '${qty}x ',
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(
                      text: price.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: 'SubTotal : \$'+ subtotal.toString(),
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
