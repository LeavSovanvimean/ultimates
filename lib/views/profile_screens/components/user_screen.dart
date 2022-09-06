import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ultimates/views/coupon_screen/coupon_screen.dart';
import 'package:ultimates/views/notification_screen/notification_screen.dart';
import 'package:ultimates/views/setting_screen/setting_screen.dart';
import 'package:ultimates/views/shipping_screen/shipping_screen.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/profile_screens/components/singin_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>
    with AutomaticKeepAliveClientMixin<UserScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: const <Widget>[
                    SizedBox(height: 100),
                    Text(
                      'PROFILE',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Guest',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Button(
                label: 'LOGIN',
                width: 165,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SinginScreen()),
                  );
                },
              ),
              const SizedBox(height: 30),
              Visibility(
                visible: false,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.edit_outlined,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Visibility(
                visible: false,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: const <Widget>[
                              Icon(
                                Icons.lock_outline,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12),
                              ),
                            ],
                          ),
                          const Icon(Icons.keyboard_arrow_right)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Icon(
                              Icons.notifications_outlined,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Notifications',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CouponScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Icon(
                              CommunityMaterialIcons.ticket_percent_outline,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Coupons',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShippingScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Icon(
                              Icons.local_shipping_outlined,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 44,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const <Widget>[
                            Icon(
                              Icons.settings_outlined,
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Setting',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 12),
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
