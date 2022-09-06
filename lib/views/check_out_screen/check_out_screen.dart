import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/widgets/text_box.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen>
    with AutomaticKeepAliveClientMixin<CheckOutScreen> {
  bool subscribe = false,
      standard = false,
      second = false,
      nextDay = false,
      master1 = false,
      master2 = false,
      master3 = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'CHECK OUT',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Order Contact Information',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextBox(
                  controller: _nameController,
                  label: 'Email Address',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 15,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(Colors.black),
                        shape: const CircleBorder(),
                        value: subscribe,
                        onChanged: (bool? value) {
                          setState(() {
                            subscribe = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Text(
                        'By subsribing to our newsletter you agree to our privacy policy. * (restrictions and exclusions apply)',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Enter Your Delivery Address',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextBox(
                  controller: _emailController,
                  label: 'Full Name',
                ),
                TextBox(
                  controller: _streetController,
                  label: 'Street Address',
                ),
                TextBox(
                  controller: _stateController,
                  label: 'State',
                ),
                TextBox(
                  controller: _countryController,
                  label: 'Country',
                ),
                TextBox(
                  controller: _zipCodeController,
                  label: 'Zip code',
                ),
                TextBox(
                  controller: _streetController,
                  label: 'Street Address line2 (Apt,Suite,etc.)',
                ),
                TextBox(
                  controller: _cityController,
                  label: 'City',
                ),
                TextBox(
                  controller: _phoneNumberController,
                  label: 'Phone Number',
                ),
                const SizedBox(height: 30),
                const Text(
                  'Shipping Method',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 15,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(Colors.black),
                        shape: const CircleBorder(),
                        value: standard,
                        onChanged: (bool? value) {
                          setState(() {
                            standard = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Standard  ',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Delivery',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const Text(
                            '5-7 Bussiness Days',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          const Text(
                            '\$0.00',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 15,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(Colors.black),
                        shape: const CircleBorder(),
                        value: second,
                        onChanged: (bool? value) {
                          setState(() {
                            second = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Second Day',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Delivery',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const Text(
                            '2-3 Bussiness Days',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          const Text(
                            '\$20.00',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 15,
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(Colors.black),
                        shape: const CircleBorder(),
                        value: nextDay,
                        onChanged: (bool? value) {
                          setState(() {
                            nextDay = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Next Day   ',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Delivery',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          const Text(
                            '1-2 Bussiness Days',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          const Text(
                            '\$30.00',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(0.30)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Payment Methods',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 15,
                              child: Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: const CircleBorder(),
                                value: master1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    master1 = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                  'assets/icons/master_card.svg'),
                            ),
                            const Text(
                              '5156 83** **** 0000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 79),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 15,
                              child: Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: const CircleBorder(),
                                value: master2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    master2 = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                  'assets/icons/master_card.svg'),
                            ),
                            const Text(
                              '5156 83** **** 0000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Expired',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 15,
                              child: Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: const CircleBorder(),
                                value: master3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    master3 = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: SvgPicture.asset(
                                  'assets/icons/master_card.svg'),
                            ),
                            const Text(
                              '5156 83** **** 0000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Expired',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Button(
                          onTap: () {},
                          label: 'ADD NEW CARD',
                          width: double.infinity,
                          height: 35,
                          color: Colors.transparent,
                          borderWidth: 2,
                          borderColor: Colors.black,
                          fontColor: Colors.black,
                          splashColor: const Color(0xffE3E3E3),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 1, color: Colors.black.withOpacity(0.30)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'ENTER PROMO CODE',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextBox(
                          controller: _promoController,
                          label: 'Promo code',
                        ),
                        const SizedBox(height: 25),
                        Button(
                          onTap: () {},
                          label: 'SUBMIT',
                          color: Colors.transparent,
                          width: 120,
                          height: 35,
                          borderWidth: 2,
                          borderColor: Colors.black,
                          fontColor: Colors.black,
                          splashColor: const Color(0xffE3E3E3),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.center,
                  child: Button(
                    label: 'PLACE ORDER',
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 300,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/icons/apple_pay.svg'),
                              iconSize: 40),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/icons/google_pay.svg'),
                              iconSize: 40),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/icons/paypal.svg'),
                              iconSize: 40),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  'assets/icons/master_card.svg'),
                              iconSize: 40),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('assets/icons/visa.svg'),
                              iconSize: 40),
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Need help? Call +855 000 000 000 ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
