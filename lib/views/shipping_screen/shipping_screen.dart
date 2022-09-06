import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/widgets/text_box.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool isSwitched = false;
  final countryPicker = const FlCountryCodePicker();
  CountryCode? country;
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _aptController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

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
            "Shipping",
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              InkWell(
                onTap: () async {
                  final countryData =
                      await countryPicker.showPicker(context: context);
                  setState(() {
                    country = countryData;
                  });
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
                            Text(
                              'Ship to',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: true,
                              child: Container(
                                child:
                                    country != null ? country!.flagImage : null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Visibility(
                                child: Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextBox(
                      controller: _contactNameController,
                      label: 'Contact Name',
                    ),
                    TextBox(
                      controller: _phoneNumberController,
                      label: 'Phone Number',
                    ),
                    TextBox(
                      controller: _streetController,
                      label: 'Street address, P.O. Box, etc',
                    ),
                    TextBox(
                      controller: _aptController,
                      label: 'Apt,Suite,Unit,etc (Optional)',
                    ),
                    TextBox(
                      controller: _stateController,
                      label: 'State/Province',
                    ),
                    TextBox(
                      controller: _cityController,
                      label: 'City',
                    ),
                    TextBox(
                      controller: _zipController,
                      label: 'Zip/Postal Code',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Set as default shipping address",
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
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Button(
                  onTap: () {},
                  label: 'SAVE',
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
