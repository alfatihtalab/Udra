import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hosham_app/api/mock_app_service.dart';
import 'package:flutter_hosham_app/controller/user_controller.dart';
import 'package:flutter_hosham_app/screens/auth/register.dart';
import 'package:flutter_hosham_app/screens/home/home_page.dart';
import 'package:flutter_hosham_app/theme_app.dart';
import 'package:get/get.dart';

import '../../nav_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var currentFocus;

  ApiServices apiServices = Get.find<ApiServices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/main_logo.jpeg'),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: username,
                    decoration: buildInputDecoration(
                        icon: Icons.account_circle, hintText: 'username'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: buildInputDecoration(
                        icon: Icons.vpn_key_rounded, hintText: 'password'),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter correct text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          //Scaffold.of(context).showSnackBar(
                          //const SnackBar(content: Text('Processing Data')));
                          FocusScope.of(context).requestFocus(FocusNode());
                          //await Future.delayed(Duration(seconds: 3));
                          var status = await apiServices.checkUser(
                              username.text, password.text);
                          print(status);
                          if (status == Status.LoggedIn) {
                            Get.offAll(const HomePage());
                            //print(user.toJson());
                          } else {
                            print('Not found');
                          }
                        }
                        ;
                      },
                      child: const Text('login')),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RegisterPage();
                        }));
                      },
                      child: const Text('register now here')),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0, left: 10, right: 10),
                  child: TextButton(
                    onPressed: () {
                      Get.off(const HomePage());
                    },
                    child: const Text(
                      'Enter as guest',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Can't remeber your account?",
                          style: DemoTheme.lightTextTheme.headline3,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'click here',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.purple),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(
      {required IconData icon, required String hintText}) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hintText,
      // fillColor: Colors.purple.shade50,
      // filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 1.5,
        ),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );
  }
}
