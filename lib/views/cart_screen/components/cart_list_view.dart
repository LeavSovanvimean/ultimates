import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimates/controllers/cart_controller.dart';
import 'package:ultimates/views/cart_screen/components/cart_card.dart';

class CartListView extends StatelessWidget {
  final double height;
  final CartController cartController = Get.find();
  CartListView({Key? key, this.height = 1.6}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        GetX<CartController>(builder: (controller) {
          return Column(
              children: cartController.cartItems
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CartCard(
                        function1: () {
                          cartController.increasQty(e);
                        },
                        function2: () {
                          cartController.decreasqty(cart: e);
                        },
                        product: e,
                      )))
                  .toList());
        }),
        const SizedBox(height: 150)
      ],
    );
  }
}
