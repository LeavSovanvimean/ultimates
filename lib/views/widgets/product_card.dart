import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ultimates/controllers/product_controller.dart';
import 'package:ultimates/views/detail_screen/detail_screen.dart';

class ProductCard extends StatefulWidget {
  final productController = Get.put(ProductController());
  final int index;
  final bool isSale;
  ProductCard({Key? key, required this.index, this.isSale = true})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(3, 3),
                spreadRadius: 0,
                blurRadius: 20)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        product: controller.products[widget.index])),
              );
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.grey.shade200,
            splashFactory: InkRipple.splashFactory,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: Image.network(
                        controller.products[widget.index].images[0]),
                  ),
                  const SizedBox(height: 10),
                  const Visibility(
                    visible: true,
                    child: Text(
                      'SALE',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      controller.products[widget.index].productName,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      //softWrap: true,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Visibility(
                    visible: false,
                    child: Text(
                      controller.products[widget.index].category,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingBarIndicator(
                    rating: controller.products[widget.index].rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Visibility(
                        visible: widget.isSale,
                        child: Text(
                          formatCurrency
                              .format(controller.products[widget.index].price),
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Visibility(
                        visible: true,
                        child: Text(
                          formatCurrency
                              .format(controller.products[widget.index].price),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
