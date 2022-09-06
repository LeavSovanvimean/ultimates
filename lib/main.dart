import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimates/views/navigation_screen/navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ultimates',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: const Color(0xffEFEFEF),
        ),
      ),
      home: MainScreen(),
    );
  }
}
