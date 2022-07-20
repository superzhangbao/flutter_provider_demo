import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  final ValueNotifier<int> notifier;

  const PageB({Key? key, required this.notifier}) : super(key: key);
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageB"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '$value',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
                },
                valueListenable: widget.notifier),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> widget.notifier.value++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
