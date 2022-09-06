import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ultimates/controllers/cart_controller.dart';
import 'package:ultimates/views/cart_screen/cart_screen.dart';
import 'package:ultimates/views/home_screen/home_screen.dart';
import 'package:ultimates/views/message_screen/message_screen.dart';
import 'package:ultimates/views/profile_screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final CartController controller = Get.put(CartController());
  MainScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const MessageScreen(),
    const CartScreen(height: 180),
    ProfileScreen(),
  ];
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController =
        _pageController = PageController(initialPage: _selectedScreenIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xffEFEFEF),
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          clipBehavior: Clip.none,
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color(0xffEFEFEF),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navbarItem(29, 'assets/icons/home.svg', 'Home', Colors.black,
                  const Color(0xffB8B7B7), 0,
                  topLeft: const Radius.circular(25)),
              navbarItem(29, 'assets/icons/comment.svg', 'Order',
                  Colors.black, const Color(0xffB8B7B7), 1),
              navbarItem(29, 'assets/icons/shopping-cart.svg', 'Cart',
                  Colors.black, const Color(0xffB8B7B7), 2),
              navbarItem(29, 'assets/icons/profile.svg', 'Profile',
                  Colors.black, const Color(0xffB8B7B7), 3,
                  topRight: const Radius.circular(25)),
            ],
          ),
        ),
      ),
    );
  }

  Widget navbarItem(double size, String icon, String label, Color activeColor,
      Color inActiveColor, int index,
      {Radius topLeft = const Radius.circular(0),
      Radius topRight = const Radius.circular(0)}) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width / 4,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.only(topLeft: topLeft, topRight: topRight),
          onTap: () {
            setState(() {
              _selectedScreenIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          splashColor: const Color(0xffDDDDDD),
          splashFactory: InkRipple.splashFactory,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size,
                width: size,
                child: SvgPicture.asset(
                  icon,
                  color: index == _selectedScreenIndex
                      ? activeColor
                      : inActiveColor,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: index == _selectedScreenIndex
                        ? activeColor
                        : inActiveColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
