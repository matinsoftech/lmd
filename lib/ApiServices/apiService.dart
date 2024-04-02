import 'dart:convert';
import 'dart:developer';

import 'package:courier_app/ApiServices/api_constants.dart';
import 'package:courier_app/ApiServices/api_modals/driver_profile.dart';
import 'package:courier_app/ApiServices/api_modals/modals.dart';
import 'package:courier_app/ApiServices/api_modals/orders_to_deliver.dart';
import 'package:courier_app/ApiServices/api_modals/picked_up_modal.dart';
import 'package:courier_app/ApiServices/api_modals/delivery_complete.dart';

import 'package:courier_app/main.dart';
import 'package:courier_app/pages/listed_order_page_for_driver.dart';
import 'package:courier_app/pages/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static Future<void> login(
    BuildContext ctx,
    String email,
    String password,
  ) async {
    var body = {'email': email, 'password': password};

    log(email + password);
    try {
      Response response = await http.post(
        Uri.parse(ApiConstants.logIn),
        body: body,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('login success');
        await SharedPreferences.getInstance().then((value) => {
              value.setString(
                'token',
                data['access_token'],
              )
            });

        await SharedPreferences.getInstance().then((value) => {
              value.setString(
                'user',
                data['user']['roles'][0]['name'],
              )
            });

         await SharedPreferences.getInstance().then((value)=>{
              value.setString('id', data['user']['id'].toString())

         });  

        print(data['access_token']);

        print("name=${data['user']['name']}");
        print('User ID: ${data['user']['id']}');
        log(data['user']['id'].toString());

        Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );

        Navigator.pushReplacement(
            ctx,
            MaterialPageRoute(
                builder: (ctx) => data['user']['roles'][0]['name'] == "driver"
                    ? RootScreen(
                        user: 'Driver',
                      )
                    : RootScreen(user: 'User')));
      } else {
        print('login failed');
        showDialog(
          context: ctx,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text("Invalid email or password. Please try again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      throw e;
    }

    print(email + password);
  }

  static Future<void> pickUp(
      BuildContext ctx, String orderID, int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = '${pref.getString('token')}';
    var body = {
      'order_id': orderID,
      'selectedValue': "2",
      "comments": "dfghjdfghj"
    };
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Response response = await http.post(Uri.parse(ApiConstants.postOrderPickUp),
        body: body, headers: header);

    if (response.statusCode == 200) {
      final content = jsonDecode(response.body.toString());
      print(content['success']);
      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) {
        return RootScreen(user: "Driver");
      }));
      print("Hello Hello hogaya success");
    } else {
      print("Fetched Failed");
    }
  }

  static Future<void> pickUpForDelivery(
      BuildContext ctx, String orderID, int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = '${pref.getString('token')}';
    var body = {
      'order_id': orderID,
      'selectedValue': "2",
    };
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Response response = await http.post(
        Uri.parse(ApiConstants.postOrderPickUpForDelivery),
        body: body,
        headers: header);

    if (response.statusCode == 200) {
      final content = jsonDecode(response.body.toString());
      print(content['success']);
      Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (_) {
        return RootScreen(user: "Driver");
      }));
      print("Hello Hello hogaya success");
    } else {
      print("Fetched Failed");
    }
  }

  static Future<List<OrderType>> getOrderType() async {
    List<OrderType> orderType = [];

    var sp = await SharedPreferences.getInstance();

    String token = '${sp.getString('token')}';

    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var response =
        await http.get(Uri.parse(ApiConstants.orderType), headers: header);
    try {
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List orderT = body['orderTypes'];
        orderType = orderT.map((e) => OrderType.fromMap(e)).toList();
        // return OrderType.fromMap(orderT);
        print(orderType[0].name);

        return orderType;
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('err fetching');
  }

  static Future<List<OrderToPickUpData>> getPickUpOrderData() async {
    List<OrderToPickUpData> pendingList = [];
    var sp = await SharedPreferences.getInstance();

    String token = '${sp.getString('token')}';
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var response =
        await http.get(Uri.parse(ApiConstants.orderToPickUp), headers: header);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // print("Body=$body");
      List pendingOrder = body['orderToPickUpData'];
      // print(pendingOrder);
      pendingList =
          pendingOrder.map((e) => OrderToPickUpData.fromJson(e)).toList();
      // print("pp=${pendingList[0].orderId}");
      // print("List=$pendingList");
      // print("object");
      return pendingList;
    } else {
      print("response failed");
      return [];
    }
  }

  static Future<List<PickedupOrders>> getPickedUpData() async {
    log("fhrueihi");
    List<PickedupOrders> pickedUp = [];
    var sp = await SharedPreferences.getInstance();
    String token = '${sp.getString('token')}';
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var response =
        await http.get(Uri.parse(ApiConstants.orderPickedUp), headers: header);
        log(response.body);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List pickedOrder = body['pickedupOrders'];
      pickedUp = pickedOrder
          .map(
            (e) => PickedupOrders.fromJson(e),
          )
          .toList();
      // print(body);

      return pickedUp;
    } else {
      print('response failed');
      return [];
    }
  }

  static Future<List<DataLists>> getData() async {
    List<DataLists> pendingDelivery = [];
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = '${sp.getString('token')}';
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var response = await http.get(Uri.parse(ApiConstants.ordersForDelivery),
        headers: header);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List toBeDeliver = body['data_lists'];
      pendingDelivery = toBeDeliver.map((e) => DataLists.fromJson(e)).toList();
      return pendingDelivery;
    }
    return [];
  }

  static Future<List<DeliveryCompleteData>> getDeliveryCompleteData() async {
    List<DeliveryCompleteData> ordersToComplete = [];
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = '${sp.getString('token')}';
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var response = await http.get(Uri.parse(ApiConstants.ordersDelivered),
        headers: header);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      // print(body);
      List deliverCompleteData = body['data_lists'];
      ordersToComplete = deliverCompleteData
          .map((e) => DeliveryCompleteData.fromJson(e))
          .toList();
      return ordersToComplete;
    }
    return [];
  }


  //DriverProfile
  static Future<DriverData> getDriverProfileData()async{

    var sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    String? id = sp.getString('id');
    log(id.toString());
    var header = {
      "Accept":"application/json",
      "Authorization":"Bearer $token"
    };

    var response = await http.get(Uri.parse(ApiConstants.baseUrl+'/api/drivers?id=$id'),headers:header);
    print(response.body);
    
      if(response.statusCode==200){
        var data = jsonDecode(response.body);
        var profileinfo = data['driver_data'];
        return DriverData.fromJson(profileinfo);
      }else{
        throw Exception('Failed to fetch driver profile');
      }

  }
}
