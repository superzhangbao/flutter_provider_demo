
import 'package:flutter/cupertino.dart';



class InheritedWidgetDemo extends InheritedWidget {

  final int num;
  InheritedWidgetDemo({required this.num, required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidgetDemo oldWidget) {
    return true;
  }


  static InheritedWidgetDemo? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedWidgetDemo>();
  }

  static InheritedWidgetDemo? ofData<T>(BuildContext context) {
    return (context
        .getElementForInheritedWidgetOfExactType<InheritedWidgetDemo>()
        ?.widget as InheritedWidgetDemo?);
  }
}
