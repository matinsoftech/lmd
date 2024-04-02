// ignore_for_file: prefer_const_constructors

import 'package:courier_app/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/listed_order_page.dart';
import '../utils/colors.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Drawer(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Image.asset("assets/profile.jpg", height: 100, width: 100),

              //Name and Email
              const SizedBox(height: 4),
              Text("Johnson Smith",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(
                "johnson@gmail.com",
                style: TextStyle(fontSize: 12),
              ),

              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage('')));
                },
                child: ListTile(
                    leading: Icon(Icons.person,
                        size: 30, color: Palette.primarycolor),
                    title: Text("Profile",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                    shape: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 248, 244, 244)))),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage(state: "",)));
                },
                child: ListTile(
                    leading: Icon(CupertinoIcons.cube_box,
                        size: 30, color: Palette.primarycolor),
                    title: Text("My Orders",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 20),
                    shape: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 248, 244, 244)))),
              ),

              SizedBox(height: mq.height * 0.11),

              GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(14),
                      height: mq.height * 0.07,
                      width: mq.width,
                      decoration: BoxDecoration(
                        color: Palette.primarycolor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.logout_rounded, color: Colors.white),
                          SizedBox(width: 4),
                          Text("Logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              )),
                        ],
                      )))
            ],
          ),
        ));
  }
}
