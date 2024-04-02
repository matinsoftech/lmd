import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/ApiServices/api_modals/modals.dart';
import 'package:courier_app/pages/order_detail_page_for_delivered.dart';
import 'package:courier_app/pages/order_detail_page_for_pending_delivery.dart';
import 'package:courier_app/provider/orderProvider.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orderFilteration/pickuporderfilteration.dart';
import 'order_detail_page.dart';

class DeliverPageForDriver extends StatefulWidget {
  DeliverPageForDriver({super.key, required this.state});
  String state;

  @override
  State<DeliverPageForDriver> createState() => _DeliverPageForDriverState();
}

class _DeliverPageForDriverState extends State<DeliverPageForDriver> {

  TextEditingController searchController = TextEditingController();
  String? searchtext;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() {
    Provider.of<OrderProvider>(context, listen: false)
        .fetchDeliveryData()
        .then((value) {});
  }

  Future<void> refresh() async {
    // Simulate a time-consuming task
    await Future.delayed(Duration(seconds: 2));

    // Generate new list of items
    setState(() {});
  }
  // _fetchOrder() async {
  //   await ApiServices.().then((value) {
  //     // print('courrier= ${value[1].orderId}');
  //   });
  // }

  int selectedStatusindex = 0;
  Color processingColor = Color(0xFFFF61AC);
  Color shippedColor = Color(0xFF4CDA63);
  Color pendingColor = Color(0xFFFF2C55);
  Color cancelledColor = Colors.grey;
  String orderStatustext = "All";

  List<String> orderStatus = [
    'Pending',
    'Delivered',
    // 'Status',
    // 'Pending'
  ];
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    // print('${orderProvider.orderTypes.length}');
    // print('${orderProvider.pendingOrders.length}');
    print(orderProvider.ordersDelivered.length);

    final mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFF5F4F7),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200),
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
                       const SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0,0,12.0,0),
                    child: TextFormField(
                      controller:searchController,
                      onChanged: (value){
                        setState(() {
                          searchtext = value;
                        });
                      },
                        cursorHeight: 24,             
                        decoration:  InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical:0,horizontal: 14),
                        hintText: "Enter Order Id", 
                        hintStyle: const TextStyle(color:Colors.black54,letterSpacing: 1), 
                        suffixIcon: const Icon(Icons.search),
                        fillColor: const Color(0xFFF0EFF5),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:const BorderSide(color:Color(0xFFF0EFF5)),
                            borderRadius: BorderRadius.circular(12)
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:const BorderSide(color:Color(0xFFF0EFF5)),
                            borderRadius: BorderRadius.circular(12)
                    
                          )
                        ),
                        
                      ),
                  ),
           
                      const SizedBox(height: 20),

                      Container(
                         padding: const EdgeInsets.only(right:16),

                        width: mq.width,
                        height: 46,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: orderStatus.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedStatusindex = index;
                                          searchController.clear();
                                          print(
                                              "pressed bottom $selectedStatusindex");
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
                              selectedStatusindex==1?
                                Container(child:GestureDetector(onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>PickupOrderFilterationPage(frompage:"delivered",)));
                                },
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(16,10,16,10),
                                  decoration: BoxDecoration(color:const Color(0xFFF0EFF5),
                                  borderRadius: BorderRadius.circular(12)
                                  ),
                                  child:const Icon(Icons.filter_list)
                                ),
                                )):SizedBox.shrink()

                          ],
                        ),
                            
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
          body: selectedStatusindex == 0
              ? orderProvider.isLoadingforDelivery == true
                  ? RefreshIndicator(
                      onRefresh: refresh,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Palette.primarycolor,
                        ),
                      ),
                    )
                  : pending()
              //  SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: [
              //           Consumer<OrderProvider>(
              //               builder: (context, provider, child) {
              //             return ListView.builder(
              //                 itemCount: provider.pendingOrders.length,
              //                 shrinkWrap: true,
              //                 physics: NeverScrollableScrollPhysics(),
              //                 itemBuilder: (context, index) {
              //                   return GestureDetector(
              //                     onTap: () {
              //                       Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) =>
              //                                   OrderDetailPage()));
              //                     },
              //                     child: Container(
              //                         padding: const EdgeInsets.all(8),
              //                         margin: const EdgeInsets.fromLTRB(
              //                             10, 10, 10, 5),
              //                         width: mq.width,
              //                         decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           borderRadius: BorderRadius.circular(9),
              //                         ),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 const Text("Order ID",
              //                                     style: TextStyle(
              //                                         color: Colors.black54)),
              //                                 // _buildstatustype(index + 1),
              //                               ],
              //                             ),
              //                             Text(
              //                                 '${provider.pendingOrders[index].orderId}',
              //                                 style: TextStyle(
              //                                     fontWeight: FontWeight.bold)),
              //                             const Divider(),
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Row(
              //                                   children: [
              //                                     Icon(Icons.circle,
              //                                         color: Color.fromARGB(
              //                                             97, 177, 168, 168),
              //                                         size: 12),
              //                                     SizedBox(width: 12),
              //                                     Text("Los Angeles, CA"),
              //                                   ],
              //                                 ),
              //                                 Text("23 Nov, 7:00 PM")
              //                               ],
              //                             ),
              //                             const SizedBox(height: 8),
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Row(
              //                                   children: [
              //                                     Icon(Icons.circle,
              //                                         color: Color(0xFFFF9501),
              //                                         size: 12),
              //                                     SizedBox(width: 12),
              //                                     Text("San Francisco, CA"),
              //                                   ],
              //                                 ),
              //                                 Text("24 Nov, 10:00 AM")
              //                               ],
              //                             )
              //                           ],
              //                         )),
              //                   );
              //                 });
              //           })
              //         ],
              //       ),
              //     ),
              //   )

              : selectedStatusindex == 1
                  ? orderProvider.isLoadingforDelivery == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Palette.primarycolor,
                          ),
                        )
                      : picked()
                  : Center(child: Text("Cancelled orders yet to be fetched"))),
    );
  }

  // _buildstatustype(int i) {
  //   switch (i) {
  //     case 1:
  //       return Container(
  //           padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12),
  //               color: processingColor),
  //           child: Text("Processing", style: TextStyle(color: Colors.white)));
  //     case 2:
  //       return Container(
  //           padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12), color: shippedColor),
  //           child: Text("Shipped", style: TextStyle(color: Colors.white)));
  //     case 3:
  //       return
  // Container(
  //           padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12), color: pendingColor),
  //           child: Text("Pending", style: TextStyle(color: Colors.white)));
  //     case 4:
  //       return Container(
  //           padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12), color: cancelledColor),
  //           child: Text("Cancelled", style: TextStyle(color: Colors.white)));
  //   }
  // }
  Widget pending() {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<OrderProvider>(context, listen: false);

    return provider.ordersToDeliver.length == 0
        ? Center(
            child: Text("No Data"),
          )
        : RefreshIndicator(
            onRefresh: refresh,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Consumer<OrderProvider>(
                        builder: (context, provider, child) {
                      // print("provider=${provider.pendingOrders[0].createdAt}");
                      return ListView.builder(
                          itemCount: provider.ordersToDeliver.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return searchController.text.isEmpty?
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderDetailPageForPendingDelivery(
                                              index: index,
                                              orderId:
                                                  '${provider.ordersToDeliver[index].id}',
                                            )));
                                print(index);
                                print(index.runtimeType);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: mq.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Order ID",
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                          Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 2, 5, 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: pendingColor),
                                              child: const Text("Pending",
                                                  style: TextStyle(
                                                      color: Colors.white)))
                                        ],
                                      ),
                                      Text(
                                          '${provider.ordersToDeliver[index].orderId}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.circle,
                                                  color: Color.fromARGB(
                                                      97, 177, 168, 168),
                                                  size: 12),
                                              const SizedBox(width: 12),
                                              Text(
                                                  '${provider.ordersToDeliver[index].hassender!.name}'),
                                            ],
                                          ),
                                          Text(
                                              '${provider.ordersToDeliver[index].hasoriginBranch!.branchAddress}')
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.circle,
                                                  color: Color(0xFFFF9501),
                                                  size: 12),
                                              SizedBox(width: 12),
                                              Text(
                                                  '${provider.ordersToDeliver[index].hasreceiver!.name}'),
                                            ],
                                          ),
                                          Text(
                                              '${provider.ordersToDeliver[index].hasdestinationBranch!.branchAddress}')
                                        ],
                                      )
                                    ],
                                  )),
                            ):provider.ordersToDeliver[index].orderId!.toLowerCase().contains(searchController.text.toLowerCase())?
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderDetailPageForPendingDelivery(
                                              index: index,
                                              orderId:
                                                  '${provider.ordersToDeliver[index].id}',
                                            )));
                                print(index);
                                print(index.runtimeType);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: mq.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Order ID",
                                              style: TextStyle(
                                                  color: Colors.black54)),
                                          Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 2, 5, 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: pendingColor),
                                              child: const Text("Pending",
                                                  style: TextStyle(
                                                      color: Colors.white)))
                                        ],
                                      ),
                                      Text(
                                          '${provider.ordersToDeliver[index].orderId}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.circle,
                                                  color: Color.fromARGB(
                                                      97, 177, 168, 168),
                                                  size: 12),
                                              const SizedBox(width: 12),
                                              Text(
                                                  '${provider.ordersToDeliver[index].hassender!.name}'),
                                            ],
                                          ),
                                          Text(
                                              '${provider.ordersToDeliver[index].hasoriginBranch!.branchAddress}')
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.circle,
                                                  color: Color(0xFFFF9501),
                                                  size: 12),
                                              SizedBox(width: 12),
                                              Text(
                                                  '${provider.ordersToDeliver[index].hasreceiver!.name}'),
                                            ],
                                          ),
                                          Text(
                                              '${provider.ordersToDeliver[index].hasdestinationBranch!.branchAddress}')
                                        ],
                                      )
                                    ],
                                  )),
                            ):Container();

                          });
                    })
                  ],
                ),
              ),
            ),
          );
  }

  Widget picked() {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<OrderProvider>(context, listen: false);

    return provider.ordersDelivered.length == 0
        ? Center(
            child: Text("No Data"),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<OrderProvider>(builder: (context, provider, child) {
                    // print("provider=${provider.pendingOrders[0].createdAt}");
                    return ListView.builder(
                        itemCount: provider.ordersDelivered.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return searchController.text.isEmpty?
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForDelivered(
                                            orderId: provider
                                                .ordersDelivered[index].id
                                                .toString(),
                                            index: index,
                                          )));
                              // print(index);
                              // print(index.runtimeType);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                                            style: TextStyle(
                                                color: Colors.black54)),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 2, 5, 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: shippedColor),
                                            child: const Text("Delivered",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.ordersDelivered[index].orderId}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color.fromARGB(
                                                    97, 177, 168, 168),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.ordersDelivered[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.ordersDelivered[index].hasoriginBranch?.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            SizedBox(width: 12),
                                            Text(
                                                '${provider.ordersDelivered[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.ordersDelivered[index].hasdestinationBranch!.branchAddress}')
                                      ],
                                    ),
                                    Text(provider.ordersDelivered[index].date?? '')
                                  ],
                                )),
                          ):provider.ordersDelivered[index].orderId!.toLowerCase().contains(searchController.text.toLowerCase())?
                                                    GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForDelivered(
                                            orderId: provider
                                                .ordersDelivered[index].id
                                                .toString(),
                                            index: index,
                                          )));
                              // print(index);
                              // print(index.runtimeType);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                                            style: TextStyle(
                                                color: Colors.black54)),
                                        Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 2, 5, 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: shippedColor),
                                            child: const Text("Delivered",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.ordersDelivered[index].orderId}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color.fromARGB(
                                                    97, 177, 168, 168),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.ordersDelivered[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.ordersDelivered[index].hasoriginBranch?.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            SizedBox(width: 12),
                                            Text(
                                                '${provider.ordersDelivered[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.ordersDelivered[index].hasdestinationBranch!.branchAddress}')
                                      ],
                                    ),
                                    Text(provider.ordersDelivered[index].date?? '')
                                  ],
                                )),
                          ):Container();

                        });
                  })
                ],
              ),
            ),
          );
  }
}
