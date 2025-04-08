// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innbucks/util/app_constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String loginBy = "email";
  late BuildContext loadingContext;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: buildBody(context)),
    );
  }

  buildBody(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "hi, welcome to",
              style: TextStyle(
                  color: Color.fromRGBO(224, 224, 224, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(224, 224, 224, 1)),
                        borderRadius: BorderRadius.circular(10)),
                    width: 72,
                    height: 72,
                    child: Image.asset(
                      "assets/logo/white_logo.png",
                      height: 48,
                      width: 36,
                    )),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: const Text(
                    AppConstants.appName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 30.0,
              ),
              child: Text(
                "login to your account",
                style: TextStyle(
                    color: Color.fromRGBO(224, 224, 224, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
            // login form container
            SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      loginBy == "email" ? "Email" : "Phone",
                      style: const TextStyle(
                          color: Color.fromRGBO(224, 224, 224, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  //  if (_login_by == "email")
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0x7EFFFFFF),
                          ),
                          child: TextField(
                            style: const TextStyle(color: Color(0xFFFFFFFF)),
                            controller: emailController,
                            autofocus: false,
                           
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          color: Color(0xFFE0E0E0),
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(255, 255, 255, 0.5)),
                          height: 36,
                          child: TextField(
                            controller: passwordController,
                            autofocus: false,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return PasswordForget();
                              // }));
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE0E0E0),
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            12.0,
                          ),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            MediaQuery.of(context).size.width,
                            50,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.8),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(11.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // loading();
                        },
                        child: Text(
                          "login",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "In case of any difficulties, contact with admin.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  loading() {
    showDialog(
      context: context,
      builder: (context) {
        loadingContext = context;
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text("Please wait..."),
            ],
          ),
        );
      },
    );
  }
}
