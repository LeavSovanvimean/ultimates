import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ultimates/controllers/cart_controller.dart';
import 'package:ultimates/models/cart.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  final CartController cartController = Get.find();
  final Cart? product;
  final Function? function1;
  final Function? function2;

  CartCard({
    Key? key,
    required this.product,
    this.function1,
    this.function2,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  final formatCurrency = NumberFormat.simpleCurrency();
  late int qty = widget.product!.qty;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120,
              child: Image.network(widget.product!.product!.images[0]),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.product!.product!.productName,
                    style: const TextStyle(fontFamily: 'Poppins', fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  RatingBarIndicator(
                    rating: widget.product!.product!.rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          widget.function2!();
                          setState(() {
                            qty = widget.product!.qty;
                          });
                        },
                        child: SizedBox(
                          height: 14,
                          child:
                              SvgPicture.asset('assets/icons/chevron-left.svg'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GetBuilder<CartController>(
                        builder: (controller) {
                          return Center(
                            child: Text(
                              widget.product!.qty.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          widget.function1!();
                          setState(() {
                            qty = widget.product!.qty;
                          });
                        },
                        child: SizedBox(
                          height: 14,
                          child: SvgPicture.asset(
                              'assets/icons/chevron-right.svg'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        formatCurrency
                            .format(widget.product!.product!.price * qty),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
