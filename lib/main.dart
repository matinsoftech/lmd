import 'package:courier_app/pages/create_order.dart';
import 'package:courier_app/pages/create_order_stepper.dart';
import 'package:courier_app/pages/customer_homepage.dart';
import 'package:courier_app/pages/listed_driver_page_for_deliver.dart';
import 'package:courier_app/pages/listed_order_page.dart';
import 'package:courier_app/pages/listed_order_page_for_driver.dart';
import 'package:courier_app/pages/login.dart';
import 'package:courier_app/pages/profile_page.dart';
import 'package:courier_app/pages/profile_page_for_driver.dart';
import 'package:courier_app/provider/orderProvider.dart';
import 'package:courier_app/splash_screen.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor primaryColor = Colors.teal;
    final ThemeData myTheme = ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    );

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OrderProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: primaryColor,
              textTheme: GoogleFonts.poppinsTextTheme()),
          // initialRoute: Login.routeName,
          home: SplashScreen(),
        ));
  }
}

class RootScreen extends StatefulWidget {
  RootScreen({super.key, required this.user});
  String user;

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.user == "Driver"
          ? Stack(
              children: [
                // currentTab == 0 ? CustomerHomePage() : Container(),
                currentTab == 0
                    ? OrderPageForDriver(
                        state: "",
                      )
                    : Container(),
                currentTab == 1
                    ? DeliverPageForDriver(
                        state: "",
                      )
                    : Container(),

                currentTab == 2 ? ProfilePageForDriver('Driver') : Container(),
              ],
            )
          : Stack(
              children: [
                currentTab == 0 ? CustomerHomePage() : Container(),
                currentTab == 1
                    ? OrderPage(
                        state: "",
                      )
                    : Container(),
                currentTab == 2 ? const CreateOrderStepper() : Container(),
                currentTab == 3 ? ProfilePage('') : Container(),
              ],
            ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(248, 248, 248, 1),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(1, 1),
                  color: Color.fromRGBO(87, 87, 87, 0.25),
                ),
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(1, 1),
                  color: Color.fromRGBO(87, 87, 87, 0.25),
                )
              ]),
          child: BottomNavigationBar(
              currentIndex: currentTab,
              unselectedItemColor: Colors.grey[500],
              selectedItemColor: Palette.primarycolor,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              selectedLabelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              iconSize: 22,
              items: widget.user == "Driver"
                  ? const [
                      // BottomNavigationBarItem(
                      //     icon: Icon(Icons.home_filled), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_bag_outlined),
                          label: "Pick up"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.delivery_dining), label: "Deliver"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.person), label: "Profile")
                    ]
                  : const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_filled), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_bag_outlined),
                          label: "Orders"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add_circle_outline),
                          label: "New Order"),
                      BottomNavigationBarItem(
                          icon: Icon(CupertinoIcons.person), label: "Profile")
                    ],
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  currentTab = value;
                });
              })),
    );
  }
}
