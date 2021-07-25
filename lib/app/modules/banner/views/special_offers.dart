import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/banner/controller/banner_c.dart';
import 'package:shop_app/app/modules/banner/model/banner_m.dart';
import 'package:shop_app/app/modules/banner/views/component/specialoffer_card.dart';
import 'package:shop_app/app/widgets/section_title.dart';

class SpecialOffers extends StatelessWidget {
  SpecialOffers({
    Key? key,
  }) : super(key: key);
  final BannerController _c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: 'Special for you',
            press: () {},
          ),
        ),
        SizedBox(height: 20),
        FutureBuilder(
            future: _c.bannerRequest(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return Text('Banner Kosong');
              }
              if (snapshot.connectionState == ConnectionState.done) {
                final bannerItem = snapshot.data as List<BannerModel>;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        bannerItem.length,
                        (index) {
                          var model = bannerItem[index];
                          return SpecialOfferCard(
                            banner: model,
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
                  child: Row(children: [
                    ...List.generate(
                      5,
                      (index) {
                        return SpecialOfferCard(isLoading: true,);
                      },
                    ),
                    SizedBox(width: 20)
                  ]));
            }),
      ],
    );
  }
}
