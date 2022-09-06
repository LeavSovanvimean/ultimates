import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ultimates/controllers/cart_controller.dart';
import 'package:ultimates/views/cart_screen/components/cart_list_view.dart';
import 'package:ultimates/views/check_out_screen/check_out_screen.dart';
import 'package:ultimates/views/widgets/button.dart';

class CartScreen extends StatefulWidget {
  final double height;
  //final CartController controller = Get.put(CartController());
  const CartScreen({Key? key, this.height = 100}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Cart (0)',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cartController.removeAllItem();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.black,
              size: 25,
            ),
            splashColor: const Color(0xffDDDDDD),
          ),
          const SizedBox(width: 15),
        ],
        //centerTitle: true,
        backgroundColor: const Color(0xffEFEFEF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CartListView(),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: widget.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.black.withOpacity(0.50),
                blurRadius: 10,
              )
            ]),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GetBuilder<CartController>(builder: (controller) {
                  return Text(
                    formatCurrency.format(controller.total),
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  );
                }),
                Button(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOutScreen()),
                    );
                  },
                  label: 'CHECK OUT',
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
