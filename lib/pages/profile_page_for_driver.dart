// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/main.dart';
import 'package:courier_app/pages/login.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ApiServices/api_modals/driver_profile.dart';

class ProfilePageForDriver extends StatefulWidget {
  ProfilePageForDriver(this.page);
  String page;

  @override
  State<ProfilePageForDriver> createState() => _ProfilePageForDriverState();
}

class _ProfilePageForDriverState extends State<ProfilePageForDriver> {
  DriverData? profile;
  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  fetchUserProfile() async {
    final fetchedprofile = await ApiServices.getDriverProfileData();
    setState(() {
      profile = fetchedprofile;
    });
    print(profile?.hasdriver?.email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.page == "Driver"
                          ? RootScreen(
                              user: 'Driver',
                            )
                          : RootScreen(
                              user: '',
                            )));
            },
          ),
        ),
        body: profile == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 14.0, left: 20),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Text("Profile Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Palette.primarycolor)),
                              const SizedBox(height: 10),
                              //Image
                              Stack(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Image.asset("assets/profile.jpg",
                                          height: 120, width: 120)),
                                ],
                              ),
                              SizedBox(height: 10),

                              Container(
                                padding: EdgeInsets.only(left: 80),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Name: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(profile?.hasdriver?.name ?? ''),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Email: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(profile?.hasdriver?.email ?? ''),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Address: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(profile?.hasdriver?.address ?? ''),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Phone: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(profile?.hasdriver?.phone ?? ''),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Divider(),
                              // Text(profile?.hasbranch?.name?? ''),
                              // Text(profile?.hasbranch?.branchAddress?? 'null')
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 8, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Branch Information",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Palette.primarycolor,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Branch Name: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(profile?.hasbranch?.name ?? ''),
                                ],
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Branch Address: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(profile?.hasbranch?.branchAddress ??
                                      'null'),
                                ],
                              ),
                            ],
                          ),
                        )),

                    SizedBox(height: 20),
                    //Edit Profile
                    // ProfileWidgetMenu(
                    //   button: () {},
                    //   title: "Edit Profile",
                    //   leadingIcon: CupertinoIcons.pencil_ellipsis_rectangle,
                    // ),

                    //My address
                    // ProfileWidgetMenu(
                    //   button: () {},
                    //   title: "My Address",
                    //   leadingIcon: CupertinoIcons.placemark,
                    // ),

                    //My order
                    // ProfileWidgetMenu(
                    //   button: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => OrderPageForDriver(
                    //                   state: "profile",
                    //                 )));
                    //   },
                    //   title: "My Order",
                    //   leadingIcon: CupertinoIcons.cube_box,
                    // ),
                    //Change Passowrd
                    // ProfileWidgetMenu(
                    //   button: () {},
                    //   title: "Change Password",
                    //   leadingIcon: Icons.key_outlined,
                    // ),

                    // Logout
                    SizedBox(height: mq.height * 0.03),
                    Card(
                      elevation: 4,
                      child: GestureDetector(
                          onTap: () async {
                            SharedPreferences sp =
                                await SharedPreferences.getInstance();
                            await sp.remove('token');
                          Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
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
                                children: [
                                  Icon(Icons.logout_rounded,
                                      color: Colors.white),
                                  SizedBox(width: 4),
                                  Text("Logout",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      )),
                                ],
                              ))),
                    )
                  ],
                ),
              ));
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 5,
        child: InkWell(
          onTap: () => {},
          child: buildCircle(
            color: color,
            all: 8,
            child: Icon(
              Icons.add_a_photo,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          color: color,
          child: child,
          padding: EdgeInsets.all(all),
        ),
      );
}

class ProfileWidgetMenu extends StatelessWidget {
  const ProfileWidgetMenu({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.button,
  });
  final String title;
  final IconData leadingIcon;
  final VoidCallback button;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(leadingIcon, color: Colors.black),
        title: Text(
          title,
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20),
            onPressed: button),
        shape: Border(
            bottom: BorderSide(color: Color.fromARGB(255, 248, 244, 244))));
  }
}
