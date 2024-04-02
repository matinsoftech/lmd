import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // List users = [];
  @override
  void initState() {
    super.initState();
    // fetchUser();

    _navigateToLogin();
  }

  // fetchUser() async {
  //   List data = await ApiServices.getPickUpOrderData();
  //   setState(() {
  //     users = data;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print(users);
    return Scaffold(
        body: Center(child: Container(child: Image.asset("assets/logo.png"))));
  }

  void _navigateToLogin() {
    Future.delayed(Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final userRole = prefs.getString('user');
      print('Token form splash = $token');
      print('User=$userRole');
      // print(user. isEmpty);
      if (token != null && token.isNotEmpty && userRole != null) {
        if (userRole == 'driver') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RootScreen(
                        user: "Driver",
                      )));
        } else if(userRole == 'franchise'){
          Navigator.push(
            context,MaterialPageRoute(builder: (context)=>RootScreen(user: "Franchise",))
          );
        }
        
        
        else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RootScreen(user: "")));
        }
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }
}
