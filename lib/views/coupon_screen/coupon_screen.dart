import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  bool shipping = false;
  bool promotion = false;
  bool order = false;
  bool other = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white10,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          title: const Text(
            "Coupon",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
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
              children: <Widget>[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              '10\$ Discount Coupon',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'This discount coupon apply for your 1st Order',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Expire on : 10-September-2022',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              '50% Discount Coupon',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'This discount coupon can apply with every product',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Expire on : 5-September-2022',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
