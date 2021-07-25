import 'package:shop_app/app/modules/cart/model/cart_m.dart';

class CartResponseWrapper {
  final bool status;
  final String message;
  List<CartItem> cartItemList;

  CartResponseWrapper(this.status, this.message, this.cartItemList);
  // To make the sample app look nicer, each item is given one of the
  // Material Design primary colors.
  // : color = Colors.primaries[id % Colors.primaries.length];

}