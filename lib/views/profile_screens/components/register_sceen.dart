import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/widgets/text_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with AutomaticKeepAliveClientMixin<RegisterScreen> {
  bool isChecked1 = false, isChecked2 = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conPasswordController = TextEditingController();

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
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  TextBox(
                    controller: _nameController,
                    label: 'Full Name',
                  ),
                  TextBox(
                    controller: _phoneController,
                    label: 'Phone Number (Optional)',
                  ),
                  TextBox(
                    controller: _emailController,
                    label: 'Email Address',
                  ),
                  TextBox(
                    controller: _passwordController,
                    label: 'Password',
                  ),
                  TextBox(
                    controller: _conPasswordController,
                    label: 'Confirm Password',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Colors.black),
                          shape: const CircleBorder(),
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('Term and agreement'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(Colors.black),
                          shape: const CircleBorder(),
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('Recive email about our news and promotion'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Button(
                    onTap: () {},
                    label: 'REGISTER',
                    width: 165,
                    color: Colors.transparent,
                    borderWidth: 2,
                    borderColor: Colors.black,
                    fontColor: Colors.black,
                    splashColor: const Color(0xffE3E3E3),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Register with',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 60,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CommunityMaterialIcons.facebook,
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CommunityMaterialIcons.google,
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.smartphone_outlined,
                              size: 28,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
