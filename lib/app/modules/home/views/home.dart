import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop_app/app/modules/cart/controller/cart_c.dart';
import 'package:shop_app/app/modules/cart/views/cart_v.dart';
import 'package:shop_app/app/modules/home/views/component/Body.dart';
import 'package:shop_app/app/modules/home/views/component/icon_button.dart';
import 'package:shop_app/app/modules/home/views/component/search_field.dart';
import 'package:shop_app/app/modules/payment/controller/payment._c.dart';
import 'package:shop_app/app/modules/payment/views/payment_history.dart';

class HomePage extends GetView<PaymentController> {
  HomePage({Key? key}) : super(key: key);
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            elevation: 5.0,
            backgroundColor: Colors.white,
            title: SearchField(),
            actions: [
              Obx(() => IconBtnWithCounter(
                    icon: LineIcons.inbox,
                    press: () {
                      Get.to(PaymentHistory());
                    },
                    numOfitem: controller.paymentList.value.length,
                  )),
              GetBuilder(builder: (CartController _c) {
                return IconBtnWithCounter(
                  icon: LineIcons.shoppingCart,
                  press: () {
                    Get.to(CartScreen());
                  },
                  numOfitem: _c.flutterCart.cartItem.length,
                );
              }),
            ],
          ),
          SliverToBoxAdapter(
            child: Body(),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // setState(() {
                //   _selectedIndex = index;
                // });
              },
            ),
          ),
        ),
      ),
    );
  }
}
