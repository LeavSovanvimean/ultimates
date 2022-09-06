import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      CommunityMaterialIcons.clock_outline,
                      size: 34,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Ultimates',
                      style: TextStyle(
                        fontFamily: 'Lemon',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text('WELCOME!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
