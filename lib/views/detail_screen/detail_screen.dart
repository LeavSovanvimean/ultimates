import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ultimates/controllers/cart_controller.dart';
import 'package:ultimates/models/product.dart';
import 'package:ultimates/views/cart_screen/cart_screen.dart';
import 'package:ultimates/views/check_out_screen/check_out_screen.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/detail_screen/components/product_images.dart';
import 'package:ultimates/views/home_screen/components/search.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qty = 1;
  String funtion = "";
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xffEEEEEE),
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              splashColor: const Color(0xffDDDDDD),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.storefront,
                color: Colors.black,
                size: 25,
              ),
              splashColor: const Color(0xffDDDDDD),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              icon: const Icon(
                CommunityMaterialIcons.cart_outline,
                color: Colors.black,
                size: 25,
              ),
              splashColor: const Color(0xffDDDDDD),
            ),
            const SizedBox(width: 10),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            ),
            splashColor: const Color(0xffDDDDDD),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProductImages(product: widget.product),
                const SizedBox(height: 30),
                Text(
                  widget.product.productName,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
                Text(
                  formatCurrency.format(widget.product.price),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
                Text(
                  widget.product.description,
                  style: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xffEFEFEF),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 4),
                    blurRadius: 15,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.4))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                onTap: () => _modalBottomSheet(context, formatCurrency, qty,
                    funtion = 'addToCart', widget.product),
                label: 'ADD TO CART',
                color: Colors.transparent,
                width: 160,
                borderWidth: 2,
                borderColor: Colors.black,
                fontColor: Colors.black,
                splashColor: const Color(0xffE3E3E3),
              ),
              Button(
                onTap: () => _modalBottomSheet(context, formatCurrency, qty,
                    funtion = 'buyNow', widget.product),
                label: 'BUY NOW',
                width: 160,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _modalBottomSheet(context, formatCurrency, qty, funtion, product) {
  final cartController = Get.put(CartController());
  showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xffEEEEEE),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: 270,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(4, 4),
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 25,
                                  spreadRadius: 0)
                            ]),
                        child: Image.network(product.images[0]),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.productName,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              formatCurrency.format(product.price * qty),
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
                            const Text('Free shipping',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black)),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Quantity',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (qty == 1) {
                              qty = 1;
                            } else {
                              qty--;
                            }
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.20),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Center(
                              child: Text(
                            '-',
                            style: TextStyle(fontSize: 24),
                          )),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        qty.toString(),
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            qty++;
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          height: 30,
                          width: 30,
                          child: const Center(
                              child: Text(
                            '+',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          )),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Button(
                        onTap: () {
                          if (funtion == 'addToCart') {
                            cartController.addToCart(product, qty);
                            Navigator.pop(context);
                          } else if (funtion == 'buyNow') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CheckOutScreen()),
                            );
                          }
                        },
                        label: 'CONTINUE',
                        width: 170,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      });
}
