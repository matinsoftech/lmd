import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/listed_order_page.dart';

class RecentDelivery extends StatelessWidget {
  const RecentDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Recent Delivery",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            GestureDetector(
              child: const Text("View All",
                  style: TextStyle(
                      color: Palette.primarycolor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderPage(
                              state: "",
                            )));
              },
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Palette.primarycolor),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(218, 218, 218, 0.45),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: Offset(1, 1)),
                // BoxShadow(
                //   color:Color.fromRGBO(218, 218, 218, 0.45),
                //     blurRadius: 2,
                //     spreadRadius: 0,
                //     offset:Offset(-1,-1)

                //   )
              ]),
          padding: const EdgeInsets.all(14),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                const Icon(CupertinoIcons.cube,
                    color: Palette.primarycolor, size: 40),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Documents",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Text("Tracking ID: UO8765487CE",
                        style: TextStyle(fontSize: 15, color: Colors.black87))
                  ],
                )
              ],
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 16, color: Palette.primarycolor),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("From",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    SizedBox(height: 3),
                    Text("Biratnagar",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 16, color: Colors.black12),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Shipped To",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    SizedBox(height: 3),
                    Text("Kathmandu",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(),
            const SizedBox(height: 6),
            const Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Status: ",
                  style: TextStyle(fontSize: 17, color: Colors.black54)),
              TextSpan(
                  text: "Your package is in transit",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))
            ]))
          ]),
        )
      ],
    );
  }
}
