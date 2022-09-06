import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimates/views/alert_screen/alert_screen.dart';
import 'package:ultimates/views/home_screen/components/menu_button.dart';
import 'package:ultimates/views/home_screen/components/product_grid_view.dart';
import 'package:ultimates/views/home_screen/components/promotionSlider.dart';
import 'package:ultimates/views/home_screen/components/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              CommunityMaterialIcons.clock_outline,
              size: 27,
              color: Colors.black,
            ),
            SizedBox(width: 2),
            Text(
              'Ultimates',
              style: TextStyle(
                fontFamily: 'Lemon',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
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
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlertScreen()),
            );
          },
          icon: const Icon(
            CommunityMaterialIcons.bell_outline,
            color: Colors.black,
            size: 25,
          ),
          splashColor: const Color(0xffDDDDDD),
        ),
        backgroundColor: const Color(0xffEFEFEF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 0),
            const PromotionSlider(),
            const SizedBox(height: 30),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MenuButton(
                      onTap: () {},
                      title: 'Shop All',
                      icon: 'assets/icons/shop_all.svg',
                    ),
                    const SizedBox(width: 15),
                    MenuButton(
                      onTap: () {},
                      title: 'Man',
                      icon: 'assets/icons/men.svg',
                    ),
                    const SizedBox(width: 15),
                    MenuButton(
                      onTap: () {},
                      title: 'Women',
                      icon: 'assets/icons/women.svg',
                    ),
                    const SizedBox(width: 15),
                    MenuButton(
                      onTap: () {},
                      title: 'Sport',
                      icon: 'assets/icons/sport.svg',
                    ),
                    const SizedBox(width: 15),
                    MenuButton(
                      onTap: () {},
                      title: 'Luxury',
                      icon: 'assets/icons/luxury.svg',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Sale',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ProductGridView(),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
