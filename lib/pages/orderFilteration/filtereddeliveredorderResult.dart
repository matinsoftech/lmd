
import 'dart:developer';

import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/pages/order_detail_page_for_delivered.dart';
import 'package:courier_app/pages/order_detail_page_for_pickedUp.dart';
import 'package:courier_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/orderProvider.dart';

class FilterOrderDeliveredResultPage extends StatefulWidget {
  final String? fromDate;
  final String? toDate;
  const FilterOrderDeliveredResultPage({super.key, required this.fromDate, required this.toDate});

  @override
  State<FilterOrderDeliveredResultPage> createState() => _FilterOrderDeliveredResultPageState();
}

class _FilterOrderDeliveredResultPageState extends State<FilterOrderDeliveredResultPage> {
    Color shippedColor = Color(0xFF4CDA63);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        // elevation: 0,
        titleSpacing: 40,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Palette.primarycolor,),
        title: const Text("Delivered Order",style:TextStyle(color:Colors.black,fontSize: 18)),

      ),
      body:picked()

    );
  }

   Widget picked() {
    final mq = MediaQuery.of(context).size;
    final provider = Provider.of<OrderProvider>(context, listen: false);
    final filteredOrders = provider.ordersDelivered.where((order){

    final orderDate = order.date ?? '';
    final formattedFromDate = widget.fromDate ?? '';
    final formattedToDate = widget.toDate ?? '';

    final fromDate = formattedFromDate.split('-').map((e) => e.padLeft(2, '0')).join('-');
    final toDate = formattedToDate.split('-').map((e) => e.padLeft(2, '0')).join('-');

    
    return ((DateTime.parse(orderDate).isAtSameMomentAs(DateTime.parse(fromDate))||
    DateTime.parse(orderDate).isAfter(DateTime.parse(fromDate))) &&
    
        (DateTime.parse(orderDate).isAtSameMomentAs(DateTime.parse(toDate))||
          DateTime.parse(orderDate).isBefore(DateTime.parse(toDate)))
         );
         
         
         
    }).toList();

    return filteredOrders.length==0
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
                        itemCount: filteredOrders.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPageForDelivered(
                                              index: index,
                                              orderId:
                                                  '${filteredOrders[index].id}')));
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
                                            child: const Text("Delivered",
                                                style: TextStyle(
                                                    color: Colors.white)))
                                      ],
                                    ),
                                    Text(
                                        '${filteredOrders[index].orderId}',
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
                                                '${filteredOrders[index].hassender!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${filteredOrders[index].hasoriginBranch!.branchAddress}')
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
                                                '${filteredOrders[index].hasreceiver!.name}'),
                                          ],
                                        ),
                                        Text(
                                            '${filteredOrders[index].hasdestinationBranch?.branchAddress}'),


                                      ],
                                    ),
                                   Text(filteredOrders[index].date?? '')    

                                  ],
                                )),
                          );
                        });
                  })
                ],
              ),
            ),
          );
  }
 
}