import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/app/modules/cart/controller/cart.dart';
import 'package:shop_app/app/modules/cart/model/cart_m.dart';
import 'package:shop_app/app/modules/cart/model/cart_respon.dart';
import 'package:shop_app/app/modules/product/model/product_m.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    storageToCart();
  }

  final _storage = GetStorage();
  var flutterCart = FlutterCart();
  late CartResponseWrapper cartResponseWrapper;
  late CartItem? _cartItem;

  void storageToCart() async {
    String cartSave = await _storage.read('cart');
    if (cartSave.isNotEmpty) {
      final listCart = jsonDecode(cartSave) as List<dynamic>;
      final listCartParsed = listCart.map((e) => CartItem.fromJson(e));
      if (listCartParsed.isNotEmpty) {
        flutterCart.cartItem.addAll(listCartParsed);
      }
    }
  }

  void lokaldb() async {
    try {
      final listcard = jsonEncode(flutterCart.cartItem);
      await _storage.write('cart', listcard);
    } catch (e) {
      print(e);
    }
  }

  void addToCart(ProductModel _productElement, {int funcQuantity = 0}) async {
    try {
      if (funcQuantity == 0) {
        cartResponseWrapper = flutterCart.addToCart(
            image: _productElement.image,
            productId: _productElement.id.toString(),
            unitPrice: _productElement.price!.toInt(),
            productName: _productElement.name,
            quantity: 1,
            );
        update();
        lokaldb();
        Get.snackbar('berhasil', cartResponseWrapper.message,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15));
      } else {
        Get.snackbar('warning', cartResponseWrapper.message,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15));
      }
    } catch (e) {
      print(e);
    }
  }

  void deleteItemFromCart(int index) async {
    cartResponseWrapper = flutterCart.deleteItemFromCart(index);
    lokaldb();
    update();
  }

  void decrementItemFromCartProvider(int index) async {
    cartResponseWrapper = flutterCart.decrementItemFromCart(index);
    lokaldb();
    update();
  }

  void incrementItemToCartProvider(int index) async {
    cartResponseWrapper = flutterCart.incrementItemToCart(index);
    lokaldb();
    update();
  }

  void incrementFromDetailProduct(cartId) async {
    cartResponseWrapper = flutterCart.incrementCartFromDetail(cartId);
    lokaldb();
    update();
    Get.snackbar('success', cartResponseWrapper.message,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(top: 20, left: 15, right: 15));
  }

  void deleteAllCartProvider() async {
    flutterCart.deleteAllCart();
    lokaldb();
    update();
  }

  double getTotalAmount() {
    return flutterCart.getTotalAmount();
  }

  int checkItemisInCart(cartId) {
    _cartItem = flutterCart.getSpecificItemFromCart(cartId);
    return _cartItem?.quantity ?? 0;
  }
}
