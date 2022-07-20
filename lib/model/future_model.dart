import 'package:flutter/cupertino.dart';

class FutureModel extends ChangeNotifier{
  String? name;

  void resetData() {
    name = 'null';
    notifyListeners();
  }
}