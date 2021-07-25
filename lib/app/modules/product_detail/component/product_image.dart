import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop_app/app/constans.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
           decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),),
          width: 238,
          child: Hero(
            tag: widget.product!.id.toString(),
            child: CachedNetworkImage(
              imageUrl: '${widget.product!.image}',
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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3, (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network(widget.product!.image.toString()),
      ),
    );
  }
}
