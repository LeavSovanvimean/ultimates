import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimates/controllers/product_controller.dart';
import 'package:ultimates/views/widgets/product_card.dart';

class ProductGridView extends StatefulWidget {
  final productController = Get.put(ProductController());
  ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (controller) {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 305,
        ),
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(index: index);
        },
      );
    });
  }
}
