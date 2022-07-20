import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/model/demo1_model.dart';
import 'package:flutter_native_demo/provider_demo2.dart';
import 'package:provider/provider.dart';

class ProviderDemo1 extends StatefulWidget {
  @override
  _ProviderDemo1State createState() => _ProviderDemo1State();
}

class _ProviderDemo1State extends State<ProviderDemo1> {

  @override
  void initState() {
    super.initState();
    // print('${context.read<Demo1Model>().count}');
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("ProviderDemo1"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text('You have pushed the button this many times:'),
    //         Text(
    //           '${Provider.of<Demo1Model>(context).count}',
    //           style: Theme.of(context).textTheme.headline4,
    //         ),
    //         TextButton(
    //             onPressed: () {
    //               Navigator.of(context).push(
    //                 MaterialPageRoute<void>(
    //                   builder: (BuildContext context) => ProviderDemo2(),
    //                 ),
    //               );
    //             },
    //             child: Text("跳转B页面"),)
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     // onPressed: () => context.read<Demo1Model>().add(),
    //     onPressed: () => Provider.of<Demo1Model>(context,listen: false).add(),
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
    return ChangeNotifierProvider<Demo1Model>(
      create: (_) => Demo1Model(),
      // child: Scaffold(
      //   appBar: AppBar(
      //     title: Text("ProviderDemo1"),
      //   ),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Text('You have pushed the button this many times:'),
      //         Text(
      //           '${context.watch<Demo1Model>().count}',
      //           style: Theme.of(context).textTheme.headline4,
      //         ),
      //         TextButton(
      //             onPressed: () {
      //               Navigator.of(context).push(
      //                 MaterialPageRoute<void>(
      //                   builder: (BuildContext context) => ProviderDemo2(),
      //                 ),
      //               );
      //             },
      //             child: Text("跳转B页面"))
      //       ],
      //     ),
      //   ),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () => context.read<Demo1Model>().add(),
      //     tooltip: 'Increment',
      //     child: Icon(Icons.add),
      //   ), // This trailing comma makes auto-formatting nicer for build methods.
      // ),
      builder: (c,child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ProviderDemo1"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('You have pushed the button this many times:'),
                Text(
                  '${c.watch<Demo1Model>().count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => ProviderDemo2(),
                        ),
                      );
                    },
                    child: Text("跳转B页面"))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => c.read<Demo1Model>().add(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
