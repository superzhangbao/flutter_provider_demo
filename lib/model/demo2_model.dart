import 'package:flutter/cupertino.dart';

class Demo2Model extends ChangeNotifier{
  int _count2 = 0;
  int _age = -100;
  List<String> list = [];

  int get count => _count2;
  int get age => _age;

  void add() {
    _count2++;
    notifyListeners();
  }

  void addAge() {
    _age++;
    notifyListeners();
  }

  void addList() {
    list.add("value$_age");
    notifyListeners();
  }
}