import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimates/models/cart.dart';
import 'package:ultimates/models/product.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  final Rx<Cart> cart = Cart().obs;

  RxList<Cart> cartItems = <Cart>[].obs;
  int get count => cartItems.length;
  var total = 0.0;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.product!.price * item.qty);

  void addToCart(Product product, int qty) {
    try {
      if (isAlredyAdded(product)) {
        Get.snackbar(
            "Check your cart", "${product.productName} is alredy added",
            colorText: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.7),
            duration: const Duration(seconds: 2));
      } else {
        var uuid = const Uuid();
        String itemId = uuid.v4();
        cartItems.add(Cart(
          id: itemId,
          product: product,
          qty: qty,
        ));
        Get.snackbar("New product added to cart",
            "${product.productName} is added to cart",
            colorText: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.7),
            duration: const Duration(seconds: 2));
        getTotalsAmount();
        update();
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  bool isAlredyAdded(Product product) =>
      cartItems.where((item) => item.product!.id == product.id).isNotEmpty;

  void decreasqty({
    required Cart cart,
  }) {
    if (cart.qty == 1) {
      removeCart(cart);

      Get.snackbar("Item Removed !", "Your have removed item from cart",
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(0.7),
          duration: const Duration(seconds: 2));
    } else {
      int index = cartItems.indexWhere((e) => e.id == cart.id);
      cartItems[index].qty = --cart.qty;
      getTotalsAmount();
      update();
    }
  }

  void increasQty(Cart cart) {
    if (cart.qty >= 1) {
      cart.toggleDone();
      getTotalsAmount();
      update();
    }
  }

  void removeCart(Cart cart) {
    cartItems.remove(cart);
    getTotalsAmount();
    update();
  }

  void removeAllItem() {
    cartItems.clear();
    getTotalsAmount();
    update();
    Get.snackbar("Item Removed !", "Your have removed all items from cart",
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.7),
        duration: const Duration(seconds: 2));
  }

  void getTotalsAmount() {
    double totalamount =
        cartItems.fold(0, (sum, item) => sum + item.product!.price * item.qty);
    total = totalamount;
  }
}
