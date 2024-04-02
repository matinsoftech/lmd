import 'package:courier_app/ApiServices/apiService.dart';
import 'package:courier_app/ApiServices/api_modals/delivery_complete.dart';
import 'package:courier_app/ApiServices/api_modals/modals.dart';
import 'package:courier_app/ApiServices/api_modals/orders_to_deliver.dart';
import 'package:courier_app/ApiServices/api_modals/picked_up_modal.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider with ChangeNotifier {
  List<OrderType> _orderTypes = [];
  List<OrderToPickUpData> _pendingOrders = [];

  List<OrderType> get orderTypes => _orderTypes;
  List<OrderToPickUpData> get pendingOrders => _pendingOrders;

  List<PickedupOrders> _pickedUpOrders = [];
  List<PickedupOrders> get pickedUpOrders => _pickedUpOrders;
  List<DataLists> _ordersToDeliver = [];
  List<DataLists> get ordersToDeliver => _ordersToDeliver;

  List<DeliveryCompleteData> _ordersDelivered = [];
  List<DeliveryCompleteData> get ordersDelivered => _ordersDelivered;
  bool isLoadingforDelivery = false;
  bool isLoadingforPending = false;

  Future<void> fetchData() async {
    isLoadingforPending = true;
    try {
      _orderTypes = await ApiServices.getOrderType();
      _pendingOrders = await ApiServices.getPickUpOrderData();
      _pickedUpOrders = await ApiServices.getPickedUpData();

      print(_orderTypes);
      print(_pendingOrders);
      // print(_pickedUpOrders);
    } catch (e) {
      print(e);
    }
    isLoadingforPending = false;

    notifyListeners();
  }

  Future<void> fetchDeliveryData() async {
    isLoadingforDelivery = true;
    try {
      _ordersToDeliver = await ApiServices.getData();
      _ordersDelivered = await ApiServices.getDeliveryCompleteData();
    } catch (e) {
      print(e);
    }
    isLoadingforDelivery = false;

    notifyListeners();
    print(ApiServices.getDeliveryCompleteData());
  }

  Future<void> pickUp(ctx, orderID, index) async {
    await ApiServices.pickUp(ctx, orderID, index);
    notifyListeners();
  }

  Future<void> pickUpForDelivery(ctx, orderID, index) async {
    await ApiServices.pickUpForDelivery(ctx, orderID, index);
    notifyListeners();
  }

  // Future<void> getUserDetails(ctx,email,pass) async {
  //   await ApiServices.login(email,pass);
  // }
}
