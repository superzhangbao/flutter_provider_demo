import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  final int count;
  final Function(int) callback;
  PageB(this.count, this.callback);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  var count = 0;
  @override
  void initState() {
    count = widget.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
          widget.callback.call(count);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
