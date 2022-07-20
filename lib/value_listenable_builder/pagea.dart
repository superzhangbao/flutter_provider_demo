import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/value_listenable_builder/pageb.dart';

ValueNotifier<int> _notifier = ValueNotifier(0);

class PageA extends StatefulWidget {
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  void _incrementCounter() {
    _notifier.value++;
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  return Text('$value', style: Theme.of(context).textTheme.headline4);
                },
                valueListenable: _notifier),
            TextButton(
              onPressed:() => pushToB(context),
              child: Text("跳转B页面"),
            ),
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

  void pushToB(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => PageB(notifier: _notifier),
      ),
    );
  }
}
