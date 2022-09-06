import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimates/views/widgets/button.dart';
import 'package:ultimates/views/widgets/text_box.dart';
import 'package:ultimates/views/profile_screens/components/register_sceen.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({Key? key}) : super(key: key);

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen>
    with AutomaticKeepAliveClientMixin<SinginScreen> {
  bool isChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            backgroundColor: Colors.white,
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
            elevation: 0,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'LOG IN',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      TextBox(
                          controller: _emailController, label: 'Email Address'),
                      const SizedBox(height: 3),
                      TextBox(
                          controller: _passwordController, label: 'Password'),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  shape: const CircleBorder(),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 12),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Forgotten your Password ?',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                Button(
                  label: 'LOGIN',
                  width: 165,
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Or',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 100,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Button(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  label: 'REGISTER',
                  width: 165,
                  color: Colors.transparent,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  fontColor: Colors.black,
                  splashColor: const Color(0xffE3E3E3),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
