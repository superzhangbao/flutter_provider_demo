import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/inherited_widget_demo.dart';
import 'package:flutter_native_demo/model/InheritedModel.dart';

class InheritedWidgetTestPage extends StatefulWidget {
  InheritedWidgetTestPage({Key? key}) : super(key: key);

  @override
  _InheritedWidgetTestPageState createState() =>
      _InheritedWidgetTestPageState();
}

class _InheritedWidgetTestPageState extends State<InheritedWidgetTestPage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget Test"),
      ),
      body: InheritedWidgetDemo(
        num: _number,
        child: ChildB(
          child: ChildC(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            setState(() {
              _number++;
            });
        },
      ),
    );
  }
}

class ChildB extends StatefulWidget {
  final Widget child;

  ChildB({Key? key, required this.child}) : super(key: key);

  @override
  _ChildBState createState() => _ChildBState();
}

class _ChildBState extends State<ChildB> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ChildB didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("ChildB build");
    return Container(
      width: double.infinity,
      color: Colors.amberAccent,
      child: Column(
        children: [const Text("我是子节点 ChildB"), widget.child],
      ),
    );
  }
}

class ChildC extends StatefulWidget {
  ChildC({Key? key}) : super(key: key);

  @override
  _ChildCState createState() => _ChildCState();
}

class _ChildCState extends State<ChildC> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("ChildC didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    print("ChildC build");
    return Container(
      width: double.infinity,
      color: Colors.red,
      child: Column(
        children: [
          const Text("我是子节点 ChildC"),
          Text("Child C number: ${InheritedWidgetDemo.of(context)?.num}"),
        ],
      ),
    );
  }
}