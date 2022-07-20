import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/consumer_demo.dart';
import 'package:flutter_native_demo/model/demo1_model.dart';
import 'package:flutter_native_demo/model/demo2_model.dart';
import 'package:flutter_native_demo/model/my_text.dart';
import 'package:provider/provider.dart';

class ProviderDemo2 extends StatefulWidget {
  @override
  _ProviderDemo2State createState() => _ProviderDemo2State();
}

class _ProviderDemo2State extends State<ProviderDemo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderDemo2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText('ProviderDemo1 have pushed the button this many times:'),
            MyText('${Provider.of<Demo1Model>(context).count}'),
            MyText('${context.watch<Demo1Model>().count}'),
            ///演示Consumer局部刷新
            ChangeNotifierProvider(
              create: (_) => Demo2Model(),
              child: Consumer<Demo2Model>(
                builder: (context, demo2Model, child) {
                  return Column(
                    children:[
                      TextButton(
                        onPressed: () {
                          demo2Model.add();
                        },
                        child: MyText("add consumer:${context.watch<Demo2Model>().count}",isConsumer: true),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<Demo1Model>().add();
                        },
                        child: MyText("add ProviderDemo1:${context.watch<Demo1Model>().count}",isConsumer: true),
                      ),
                    ],
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => ConsumerDemo(),
                  ),
                );
              },
              child: MyText("跳转Consumer 代码演示"),
            ),
          ],
        ),
      ),
      ///演示
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Provider.of<Demo1Model>(context,listen: false).add(),
        // onPressed: () => context.watch<Demo1Model>().add(),
        onPressed: () => context.read<Demo1Model>().add(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
