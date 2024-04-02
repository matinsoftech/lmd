import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_detail_page.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key, required this.state});
  String state;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    _fetchOrder();
    super.initState();
  }

  _fetchOrder() async {
    await ApiServices.getOrderType().then((value) {
      print('courrier ${value[1].name}');
    });
  }

  int selectedStatusindex = 0;
  Color processingColor = Color(0xFFFF61AC);
  Color shippedColor = Color(0xFF4CDA63);
  Color pendingColor = Color(0xFFFF2C55);
  Color cancelledColor = Colors.grey;
  String orderStatustext = "All";

  List<String> orderStatus = [
    'All',
    'Shipped',
    'Processing',
    'Cancelled',
    'Pending'
  ];
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF5F4F7),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // IconButton(icon:
                      // Icon(CupertinoIcons.color_filter,color:Colors.black),
                      // onPressed: (){
                      //   Navigator.pop(context);
                      // }
                      // ),
                      const SizedBox(height: 6),
                      widget.state == "profile"
                          ? Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_ios),
                                ),
                                Text("Orders",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 26)),
                                const SizedBox(height: 10),
                              ],
                            )
                          : const Text("Orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 26)),
                      const SizedBox(height: 10),

                      Container(
                        width: mq.width,
                        height: 46,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: orderStatus.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedStatusindex = index;
                                    });
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: selectedStatusindex == index
                                              ? Palette.primarycolor
                                              : Color(0xFFF0EFF5)),
                                      child: Text(orderStatus[index],
                                          style: TextStyle(
                                              color:
                                                  selectedStatusindex == index
                                                      ? Colors.white
                                                      : Color(0xFF6A6A6A),
                                              fontSize: 16))));
                            }),
                      )
                    ],
                  ),
                )),
          ),
          // backgroundColor: Colors.white,
          // appBar: AppBar(

          //   elevation:0,
          //   leading:IconButton(icon: const Icon(Icons.arrow_back_ios,color:Colors.white),
          //   onPressed: (){
          //     Navigator.pop(context);
          //   },
          //   )

          // ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: orderStatus.length - 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => OrderDetailPage(
                            //               index: index,
                            //             )));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                              width: mq.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Order ID",
                                          style:
                                              TextStyle(color: Colors.black54)),
                                      _buildstatustype(index + 1),
                                    ],
                                  ),
                                  const Text("9432747CEE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.circle,
                                              color: Color.fromARGB(
                                                  97, 177, 168, 168),
                                              size: 12),
                                          SizedBox(width: 12),
                                          Text("Los Angeles, CA"),
                                        ],
                                      ),
                                      Text("23 Nov, 7:00 PM")
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.circle,
                                              color: Color(0xFFFF9501),
                                              size: 12),
                                          SizedBox(width: 12),
                                          Text("San Francisco, CA"),
                                        ],
                                      ),
                                      Text("24 Nov, 10:00 AM")
                                    ],
                                  )
                                ],
                              )),
                        );
                      })
                ],
              ),
            ),
          )),
    );
  }

  _buildstatustype(int i) {
    switch (i) {
      case 1:
        return Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: processingColor),
            child: Text("Processing", style: TextStyle(color: Colors.white)));
      case 2:
        return Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: shippedColor),
            child: Text("Shipped", style: TextStyle(color: Colors.white)));
      case 3:
        return Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: pendingColor),
            child: Text("Pending", style: TextStyle(color: Colors.white)));
      case 4:
        return Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: cancelledColor),
            child: Text("Cancelled", style: TextStyle(color: Colors.white)));
    }
  }
}
