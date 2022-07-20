import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/model/future_model.dart';
import 'package:provider/provider.dart';

import 'model/my_text.dart';

class FutureProviderDemo extends StatefulWidget {
  @override
  _FutureProviderDemoState createState() => _FutureProviderDemoState();
}

class _FutureProviderDemoState extends State<FutureProviderDemo> {
  var futureModel = FutureModel();
  Future<FutureModel?> getData() {
    return Future.delayed(Duration(milliseconds: 3000,),() {
      print("返回数据");
      futureModel.name = "zandra";
      return futureModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<FutureModel?>.value(
      value: getData(),
      initialData: futureModel,
      builder: (context,child) {
        return Container(
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child:Column(
            children: [
              MyText('${_getText(context)}'),
              TextButton(
                onPressed: () {
                  context.read<FutureModel?>()?.resetData();
                  // getData();
                },
                child: Text("刷新"),),
            ],
          ),
        );
      },
    );
  }

  String _getText(BuildContext context) {
    return context.watch<FutureModel?>()?.name ?? 'loading';
  }
}
