import 'dart:async';

import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/pages/signup.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const routeName = '/splashScreen';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    // ApiServices();
    // isLoading = false;
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  bool remembericon = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  isLoadingFun(state) {
    setState(() {
      isLoading = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Palette.primarycolor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                )),
            body: SingleChildScrollView(
              child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: mq.height * 0.04),
                        Text("Welcome Back",
                            style: GoogleFonts.poppins(fontSize: 30)),
                        // SizedBox(height:mq.height*0.01),
                        Text("Sign in to continue",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: Colors.black54)),
                        SizedBox(height: mq.height * 0.05),
                        const Text("Email",
                            style: TextStyle(fontSize: 18, letterSpacing: 1)),
                        const SizedBox(height: 3),
                        TextFormField(
                          controller: email,
                          cursorHeight: 24,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 14),
                              hintText: "Email Address",
                              hintStyle: const TextStyle(
                                  color: Colors.black54, letterSpacing: 1),
                              prefixIcon: const Icon(CupertinoIcons.mail),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Palette.primarycolor),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        SizedBox(height: mq.height * 0.02),
                        const Text("Password",
                            style: TextStyle(fontSize: 18, letterSpacing: 1)),
                        const SizedBox(height: 3),
                        TextFormField(
                          controller: password,
                          cursorHeight: 24,
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 14),
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: Colors.black54, letterSpacing: 1),
                              prefixIcon: const Icon(Icons.lock_outline),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Palette.primarycolor),
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  // margin:const EdgeInsets.only(left:10),
                                  height: 30,
                                  width: 30,
                                  child: Checkbox(
                                      value: remembericon,
                                      onChanged: (value) {
                                        setState(() {
                                          remembericon = value!;
                                        });
                                      }),
                                ),
                                const SizedBox(width: 4),
                                const Text("Remember me",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15)),
                              ],
                            ),
                            const Text("Forgot Password?",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16))
                          ],
                        ),

                        SizedBox(height: mq.height * 0.04),
                        GestureDetector(
                            onTap: () async {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RootScreen()));
                              setState(() {
                                isLoading = true;
                              });
                              await ApiServices.login(
                                context,
                                email.text,
                                password.text,
                              );
                              setState(() {
                                isLoading = false;
                              });
                              final sf = await SharedPreferences.getInstance();
                              print('The token is ${sf.getString('token')}');
                            },
                            child: Container(
                                width: mq.width,
                                height: mq.height * 0.07,
                                decoration: BoxDecoration(
                                    color: Palette.primarycolor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white54,
                                          )
                                        : const Text("Sign In",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))))),
                        SizedBox(height: mq.height * 0.2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black54)),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: const Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            )));
  }
}
