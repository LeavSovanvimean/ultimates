import 'package:flutter/material.dart';
import 'package:ultimates/views/profile_screens/components/register_sceen.dart';
import 'package:ultimates/views/profile_screens/components/singin_screen.dart';
import 'package:ultimates/views/profile_screens/components/user_screen.dart';

class ProfileScreen extends StatelessWidget {
  final List screens = [
    const UserScreen(),
    const SinginScreen(),
    const RegisterScreen(),
  ];

  ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return screens[0];
  }
}
