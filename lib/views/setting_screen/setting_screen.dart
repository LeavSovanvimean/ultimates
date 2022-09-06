import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
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
            "Setting",
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
                    "Allow app to access your location",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 15,
                    value: isSwitched,
                    borderRadius: 20.0,
                    padding: 5,
                    activeColor: Colors.black,
                    inactiveColor: Colors.black.withOpacity(0.1),
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Version",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Text(
                    "1.0.0.0",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ],
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Container(
              //     width: 300,
              //     height: 1,
              //     color: Colors.grey,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
