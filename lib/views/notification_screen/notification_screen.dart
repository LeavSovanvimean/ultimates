import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
            "Notification",
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Alert Shipping Status",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 15,
                    value: shipping,
                    borderRadius: 20.0,
                    padding: 5,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black.withOpacity(0.1),
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        shipping = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Promotions",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 15,
                    value: promotion,
                    borderRadius: 20.0,
                    padding: 5,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black.withOpacity(0.1),
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        promotion = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Orders",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 15,
                    value: order,
                    borderRadius: 20.0,
                    padding: 5,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black.withOpacity(0.1),
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        order = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Others",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 15,
                    value: other,
                    borderRadius: 20.0,
                    padding: 5,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black.withOpacity(0.1),
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        other = val;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
