import 'package:ultimates/models/product.dart';

class Cart {
  String id;
  Product? product;
  int qty;

  Cart({this.id = "", this.product, this.qty = 0});

  Cart copyWith({
    String? id,
    Product? product,
    int? qty,
  }) =>
      Cart(
          id: id ?? this.id,
          product: product ?? this.product,
          qty: qty ?? this.qty);

  // @override
  // List<Object> get props => [id, qty, product];

  void toggleDone() {
    qty++;
  }

  void decreaseDown() {
    qty--;
  }
}
