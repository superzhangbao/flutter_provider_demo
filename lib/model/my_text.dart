import 'package:flutter/cupertino.dart';

class MyText extends Text{
  final bool isConsumer;
  MyText(String data,{this.isConsumer = false}) : super(data);


  @override
  Widget build(BuildContext context) {
    print("data:$data  isConsumer:$isConsumer:我刷新了");
    return super.build(context);
  }
}