import 'package:courier_app/main.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'customer_homepage.dart';

class OrderRequestPage extends StatelessWidget {
  const OrderRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFF0EFF5),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
          child: Column(
            children: [
              Container(
                // height:500,
                width: mq.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                      child: Column(
                        children: const [
                          Text("Success!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 33)),
                          SizedBox(height: 20),
                          Icon(Icons.check_circle,
                              color: Palette.primarycolor, size: 120),
                          SizedBox(height: 20),
                          Text("Thank you for order",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(height: 10),
                          Center(
                              child: Text("We'll review your request and",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15))),
                          // Center(child: Text("As soon as someone is free,",style:TextStyle(color:Colors.black54,fontSize: 15))),
                          Center(
                              child: Text("immediately arrive.",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15))),
                        ],
                      ),
                    ),
                    // const SizedBox(height:30),
                    // GestureDetector(
                    //   onTap:(){},
                    //   child:Container(
                    //     padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    //     width:mq.width,
                    //     decoration:const BoxDecoration(
                    //     color:Palette.primarycolor,
                    //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
                    //     ),
                    //     child:const Center(child: Text("Track Order",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 20)))
                    //   )
                    // )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RootScreen(
                                  user: '',
                                )));
                  },
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      width: mq.width,
                      decoration: BoxDecoration(
                        color: Palette.primarycolor,
                        borderRadius: BorderRadius.circular(12),
                        // border:Border.all(color:Palette.primarycolor)
                      ),
                      child: const Center(
                          child: Text("Back to Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)))))
            ],
          ),
        ));
  }
}
