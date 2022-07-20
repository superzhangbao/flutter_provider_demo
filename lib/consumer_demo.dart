import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/model/counter_notifier.dart';
import 'package:flutter_native_demo/model/demo1_model.dart';
import 'package:flutter_native_demo/model/demo2_model.dart';
import 'package:flutter_native_demo/model/my_text.dart';
import 'package:provider/provider.dart';

class ConsumerDemo extends StatefulWidget {
  @override
  _ConsumerDemoState createState() => _ConsumerDemoState();
}

class _ConsumerDemoState extends State<ConsumerDemo> {

  CounterNotifier _counter = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer-Selector Demo"),
      ),
      body: Center(
        child: ChangeNotifierProvider.value(
          value: _counter,
          child: Column(
            children: <Widget>[
              MyText('ProviderDemo1 have pushed the button this many times:'),
              MyText('${Provider.of<Demo1Model>(context).count}'),
              ///演示Consumer局部刷新
              ChangeNotifierProvider(
                create: (_) => Demo2Model(),
                child: Column(
                  children: [
                    Consumer<Demo2Model>(
                      builder: (context, demo2Model, child) {
                        return Column(
                          children:[
                            TextButton(
                              onPressed: () {
                                demo2Model.add();
                              },
                              child: MyText("add consumer:${context.watch<Demo2Model>().count}",isConsumer: true),
                            ),
                            // TextButton(
                            //   onPressed: () {
                            //     context.read<Demo1Model>().add();
                            //   },
                            //   child: MyText("add ProviderDemo1:${context.watch<Demo1Model>().count}",isConsumer: true),
                            // ),
                          ],
                        );
                      },
                    ),
                    Selector<Demo2Model,List>(
                      selector: (_,demo2Model) => demo2Model.list,
                      shouldRebuild: (pre,next){
                        print('pre:${pre.toString()} next:${next.toString()}');
                        return true;
                      },
                      builder: (context,age,child) {
                        return Column(
                          children:[
                            TextButton(
                              onPressed: () {
                                // context.read<Demo2Model>().addList();
                                context.read<Demo2Model>().addAge();
                                print('list:${context.read<Demo2Model>().list.toString()}');
                              },
                              child: MyText("add selector:${age}",isConsumer: true),
                            ),
                          ],
                        );
                      },
                    ),
                    Selector<Demo2Model,int>(
                      selector: (_,demo2Model) => demo2Model.age,
                      builder: (context,age,child) {
                        return Column(
                          children:[
                            TextButton(
                              onPressed: () {
                                context.read<Demo2Model>().addAge();
                              },
                              child: MyText("add selector:$age",isConsumer: true),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
