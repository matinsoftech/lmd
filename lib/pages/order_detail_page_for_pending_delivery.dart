// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/provider/orderProvider.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../components/parcel_timeline.dart';
import 'create_order_nextpage.dart';

class OrderDetailPageForPendingDelivery extends StatefulWidget {
  OrderDetailPageForPendingDelivery(
      {super.key, required this.index, required this.orderId});
  int index;
  String orderId;

  @override
  State<OrderDetailPageForPendingDelivery> createState() =>
      _OrderDetailPageForPendingDeliveryState();
}

class _OrderDetailPageForPendingDeliveryState
    extends State<OrderDetailPageForPendingDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F4F7),
        appBar: AppBar(
            backgroundColor: const Color(0xFFF5F4F7),
            elevation: 0,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                }),
            // titleSpacing: 0,
            title: const Text("Order Details",
                style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<OrderProvider>(builder: (context, provider, child) {
              String od =
                  '${provider.ordersToDeliver[widget.index].hasordertype!.name}';
              String orderType = '${od[0].toUpperCase}' + od.substring(1);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Order ID",
                      style: TextStyle(color: Colors.black54)),
                  Text("${provider.ordersToDeliver[widget.index].orderId}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  SizedBox(height: 10),
                  // Source Destination

                  TimelineTile(
                    afterLineStyle: LineStyle(thickness: 1),
                    isFirst: true,
                    indicatorStyle: IndicatorStyle(
                        color: Color(0xFFFF9503),
                        iconStyle: IconStyle(
                            iconData: Icons.circle, color: Colors.white)),
                    endChild: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sender",
                                style: TextStyle(color: Colors.black54)),
                            Text(
                                "${provider.ordersToDeliver[widget.index].hassender!.name}",
                                style: TextStyle(fontSize: 16)),
                            Text(
                                "${provider.ordersToDeliver[widget.index].hasoriginBranch!.branchAddress}")
                          ]),
                    ),
                  ),
                  TimelineTile(
                    beforeLineStyle: LineStyle(thickness: 1),
                    isLast: true,
                    indicatorStyle: IndicatorStyle(
                        color: Color(0xFFFF2D54),
                        iconStyle: IconStyle(
                            iconData: Icons.circle, color: Colors.white)),
                    endChild: Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 8.0, top: 14),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recipient",
                                style: TextStyle(color: Colors.black54)),
                            Text(
                                "${provider.ordersToDeliver[widget.index].hasreceiver!.name}",
                                style: TextStyle(fontSize: 16)),
                            Text(
                                "${provider.ordersToDeliver[widget.index].hasdestinationBranch!.branchAddress}")
                          ]),
                    ),
                  ),

                  SizedBox(height: 16),

                  //Weight
                  Text(provider.ordersToDeliver[widget.index].hascourier!
                              .weightQuantity !=
                          null
                      // ignore: dead_code
                      ? "Weight(kg)"
                      : "Volume"),
                  Text(
                      provider.ordersToDeliver[widget.index].hascourier!
                                  .weightQuantity !=
                              null
                          // ignore: dead_code
                          ? provider.ordersToDeliver[widget.index].hascourier!
                              .actWeight
                              .toString()
                          : provider.ordersToDeliver[widget.index].hascourier!
                              .quantity
                              .toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  SizedBox(height: 4),
// //Package Details
//                   const Text("Package",
//                       style: TextStyle(color: Colors.black54)),
//                   Text("Green Versatile Fan",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       )),
                  //Order Date Details
                  const Text("Ordered date",
                      style: TextStyle(color: Colors.black54)),
                  Text("${provider.ordersToDeliver[widget.index].date}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  //Order Type
                  const Text("Order type",
                      style: TextStyle(color: Colors.black54)),
                  Text(
                      "${provider.ordersToDeliver[widget.index].hasordertype!.name![0].toUpperCase()}${provider.ordersToDeliver[widget.index].hasordertype!.name!.substring(1)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  //Cost
                  SizedBox(height: 16),
                  const Text("Cost", style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 4),
                  ContainerWidget(contains: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Courier Charge", style: TextStyle(fontSize: 17)),
                        Text("\$20",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery", style: TextStyle(fontSize: 17)),
                        Text("\$10",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Coupon", style: TextStyle(fontSize: 17)),
                        Text("-\$5",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17)),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total", style: TextStyle(fontSize: 17)),
                        Text("\$25",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  ]),

                  const SizedBox(height: 22),

                  // //Order Status
                  // const Text("Order Status",
                  //     style:
                  //         TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),

                  // const ParcelTimelineTile(
                  //   isFirst: true,
                  //   isLast: false,
                  //   isPast: true,
                  //   txt1: "Request Accepted",
                  //   txt2: "7:00 AM .Feb 7,2023",
                  // ),
                  // const ParcelTimelineTile(
                  //   isFirst: false,
                  //   isLast: false,
                  //   isPast: true,
                  //   txt1: "Parcel Picked",
                  //   txt2: "9:00 AM .Feb 7,2023",
                  // ),
                  // const ParcelTimelineTile(
                  //   isFirst: false,
                  //   isLast: false,
                  //   isPast: false,
                  //   txt1: "Drop Point",
                  //   txt2: "3:00 PM .Feb 7,2023",
                  // ),
                  // const ParcelTimelineTile(

                  //   isFirst: false,
                  //   isLast: true,
                  //   isPast: false,
                  //   txt1: "Delivered at Address",
                  //   txt2: "5:00 PM .Feb 7,2023",
                  // )

                  Consumer<OrderProvider>(builder: (context, provider, child) {
                    return Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // ApiServices.pickUp(context, orderId, index);
                          provider.pickUpForDelivery(
                              context, widget.orderId, widget.index);
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Pick Up",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    );
                  })
                ],
              );
            }),
          ),
        ));
  }
}
