/// [Cart Model] for managing cart data
class CartItem {
  CartItem(
      {this.uuid,
      this.productId,
      this.productName,
      this.unitPrice,
      this.subTotal,
      this.quantity = 0,
      this.itemCartIndex = -1,
      this.image,});

  String? uuid;
  String? productId;
  String? productName;
  int? unitPrice;
  double? subTotal;
  int quantity;
  int itemCartIndex;
  String? image;

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      uuid: json['uuid'],
      productId: json['product_id'],
      productName: json['product_name'],
      unitPrice: json['unit_price'],
      subTotal: json['sub_total'],
      quantity: json['quantity'],
      itemCartIndex: json['item_cart_index'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['unit_price'] = unitPrice;
    data['sub_total'] = subTotal;
    data['quantity'] = quantity;
    data['item_cart_index'] = itemCartIndex;
    data['image'] = image;
    return data;
  }
}
