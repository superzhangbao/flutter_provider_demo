import 'package:flutter/material.dart';
import 'package:flutter_native_demo/consumer_demo.dart';
import 'package:flutter_native_demo/future_provider.dart';
import 'package:flutter_native_demo/inherited_widget_test_page.dart';
import 'package:flutter_native_demo/model/demo1_model.dart';
import 'package:flutter_native_demo/page_key_example.dart';
import 'package:flutter_native_demo/provider_demo1.dart';
import 'package:flutter_native_demo/test.dart';
// import 'package:flutter_native_demo/value_listenable_builder/pagea.dart';
// import 'package:flutter_native_demo/provider_demo1.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:provider/provider.dart';

// final helloWorldProvider = Provider((_) => 'Hello world');
ValueNotifier<int> _notifier = ValueNotifier(0);

void main() {
  // runApp(
  //     MyApp()
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Demo1Model())
      ],
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: PageA(),
      home:ProviderDemo1(),
      // home:ConsumerDemo(),
      // home:InheritedWidgetTestPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // setState(() {
      _notifier.value++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
           ValueListenableBuilder<int>(
             builder: (BuildContext context, int value, Widget? child) {
               // This builder will only get called when the _counter
               // is updated.
               return Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Text(
                     '$value',
                     style: Theme.of(context).textTheme.headline4,
                   ),
                   // child!,
                 ],
               );
             },
             valueListenable: _notifier)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
