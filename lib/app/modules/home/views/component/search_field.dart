import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/constans.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {},
        child: Container(
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Search Product',
                    style: TextStyle(color: Colors.black45, fontSize: 14))
              ],
            )),
      ),
    );
  }
}
