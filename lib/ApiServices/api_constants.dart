class ApiConstants {
  static String baseUrl = 'https://courier.questal.in';
  static String logIn = '$baseUrl/api/signup';
  static String orderType = '$baseUrl/api/orderType';
  static String orderToPickUp = '$baseUrl/api/order_pickup';
  static String orderPickedUp = '$baseUrl/api/picked_uporder';
  static String ordersForDelivery =
      'https://courier.questal.in/api/order_delivery';
  static String ordersDelivered =
      'https://courier.questal.in/api/deliverycomplete';
  static String postOrderPickUp = "$baseUrl/api/order_pickup/orderToPicupStatus";
  static String postOrderPickUpForDelivery = "$baseUrl/api/order_delivery";

  static String driverProfile = "$baseUrl/api/drivers";

}
