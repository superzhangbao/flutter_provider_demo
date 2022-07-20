import 'package:flutter/cupertino.dart';

class Demo1Model extends ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}