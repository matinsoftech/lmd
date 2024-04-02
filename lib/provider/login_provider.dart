import 'package:flutter/cupertino.dart';

class LogInProvider with ChangeNotifier {
  bool isVisbible = false;
  void error() {
    isVisbible = true;
    notifyListeners();
  }
}
