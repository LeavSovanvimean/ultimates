import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              splashColor: const Color(0xffDDDDDD),
            ),
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 25,
            ),
            splashColor: const Color(0xffDDDDDD),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffEFEFEF),
          elevation: 0,
        ),
        body: Container(
          color: Colors.red,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.red,
              child: const SizedBox(
                height: 50,
                width: 100,
              ),
            ),
          ),
        ));
  }
}
