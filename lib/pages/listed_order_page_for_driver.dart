import 'dart:developer';

import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/ApiServices/api_modals/modals.dart';
import 'package:courier_app/ApiServices/api_modals/picked_up_modal.dart';
import 'package:courier_app/pages/order_detail_page_for_pickedUp.dart';
import 'package:courier_app/provider/orderProvider.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orderFilteration/pickuporderfilteration.dart';
import 'order_detail_page.dart';

class OrderPageForDriver extends StatefulWidget {
  OrderPageForDriver({super.key, required this.state});
  String state;

  @override
  State<OrderPageForDriver> createState() => _OrderPageForDriverState();
}

class _OrderPageForDriverState extends State<OrderPageForDriver> {
  
  String? fromDate;
  String? toDate;
  String? searchtext;
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).fetchData();

    _fetchOrder();
    _getPickedUpData();
    ApiServices.getData();
  }


  _fetchOrder() async {
    await ApiServices.getPickUpOrderData().then((value) {
      print('courrier= ${value[1].orderId}');
    });
  }

  _getPickedUpData()async{
    await ApiServices.getPickedUpData();
  }

  int selectedStatusindex = 0;
  Color processingColor = const Color(0xFFFF61AC);
  Color shippedColor = const Color(0xFF4CDA63);
  Color pendingColor = const Color(0xFFFF2C55);
  Color cancelledColor = Colors.grey;
  String orderStatustext = "All";
  TextEditingController searchController = TextEditingController();

  List<String> orderStatus = [
    'Pending',
    'Picked up',
    // 'Status',
    // 'Pending'
  ];
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

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
                      const SizedBox(height: 6),
                      widget.state == "profile"
                          ? Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back_ios),
                                ),
                                const Text("Orders",
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
                                          setState(() {
                                            searchController.clear();
                                          });
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
                                                  : const Color(0xFFF0EFF5)),
                                          child: Text(orderStatus[index],
                                              style: TextStyle(
                                                  color:
                                                      selectedStatusindex == index
                                                          ? Colors.white
                                                          : const Color(0xFF6A6A6A),
                                                  fontSize: 16))));
                                }),
                                selectedStatusindex==1?
                                Container(child:GestureDetector(onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const PickupOrderFilterationPage(frompage:"pickedup")));
                                },
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(16,10,16,10),
                                  decoration: BoxDecoration(color:const Color(0xFFF0EFF5),
                                  borderRadius: BorderRadius.circular(12)
                                  ),
                                  child:const Icon(Icons.filter_list)
                                ),
                                ))
                                :const SizedBox.shrink()
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
          body: selectedStatusindex == 0
              ? orderProvider.isLoadingforPending
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Palette.primarycolor,
                    ))
                  : pending()

              : selectedStatusindex == 1
                  ? orderProvider.isLoadingforPending
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Palette.primarycolor,
                        ))
                      : picked()
                  : const Center(child: Text("Cancelled orders yet to be fetched"))),
    );
  }

  Widget pending() {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<OrderProvider>(context, listen: false);
    log(provider.pendingOrders.length.toString());

    return provider.pendingOrders.length == 0
        ? const Center(child: Text("No Data"))
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Consumer<OrderProvider>(builder: (context, provider, child) {
                    // print("provider=${provider.pendingOrders[0].createdAt}");
                    return ListView.builder(
                        itemCount: provider.pendingOrders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return searchController.text.isEmpty?
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForPickUp(
                                            index: index,
                                            orderId:
                                                '${provider.pendingOrders[index].id}',
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
                                                color: pendingColor),
                                            child: const Text("Pending",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.pendingOrders[index].orderId}',
                                        style: const TextStyle(
                                            
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
                                                '${provider.pendingOrders[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pendingOrders[index].hasoriginBranch!.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.pendingOrders[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pendingOrders[index].hasdestinationBranch?.branchAddress}')
                                      ],
                                    )
                                  ],
                                )),
                          )
                          :provider.pendingOrders[index].orderId!.toLowerCase().contains(searchController.text.toLowerCase())?
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForPickUp(
                                            index: index,
                                            orderId:
                                                '${provider.pendingOrders[index].id}',
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
                                                color: pendingColor),
                                            child: const Text("Pending",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.pendingOrders[index].orderId}',
                                        style: const TextStyle(
                                          color:Palette.primarycolor,
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
                                                '${provider.pendingOrders[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pendingOrders[index].hasoriginBranch!.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.pendingOrders[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pendingOrders[index].hasdestinationBranch?.branchAddress}')
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
          );
  }

  Widget picked() {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<OrderProvider>(context, listen: false);
    log(provider.pickedUpOrders.length.toString());

    return provider.pickedUpOrders.length == 0
        ? const Center(
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
                        itemCount: provider.pickedUpOrders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          log(provider.pickedUpOrders.length.toString());
                          return searchController.text.isEmpty?
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForPickedUp(
                                              index: index,
                                              orderId:
                                                  '${provider.pickedUpOrders[index].id}')));
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
                                            child: const Text("Picked up",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.pickedUpOrders[index].orderId}',
                                        style: const TextStyle(
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
                                                '${provider.pickedUpOrders[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pickedUpOrders[index].hasoriginBranch!.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.pickedUpOrders[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pickedUpOrders[index].hasdestinationBranch?.branchAddress}'),


                                      ],
                                    ),
                                   Text(provider.pickedUpOrders[index].date?? '')    

                                  ],
                                )),
                          ):provider.pickedUpOrders[index].orderId!.toLowerCase().contains(searchController.text.toLowerCase())?
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForPickedUp(
                                              index: index,
                                              orderId:
                                                  '${provider.pickedUpOrders[index].id}')));
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
                                            child: const Text("Picked up",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${provider.pickedUpOrders[index].orderId}',
                                        style: const TextStyle(
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
                                                '${provider.pickedUpOrders[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pickedUpOrders[index].hasoriginBranch!.branchAddress}')
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.circle,
                                                color: Color(0xFFFF9501),
                                                size: 12),
                                            const SizedBox(width: 12),
                                            Text(
                                                '${provider.pickedUpOrders[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${provider.pickedUpOrders[index].hasdestinationBranch?.branchAddress}'),


                                      ],
                                    ),
                                   Text(provider.pickedUpOrders[index].date?? '')    

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
