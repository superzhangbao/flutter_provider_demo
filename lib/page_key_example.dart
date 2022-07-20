
import 'package:flutter/material.dart';
import 'package:flutter_native_demo/Box.dart';

class PageKeyExample extends StatefulWidget {
  const PageKeyExample({Key? key}) : super(key: key);

  @override
  _PageKeyExampleState createState() => _PageKeyExampleState();
}

class _PageKeyExampleState extends State<PageKeyExample> {
  final List<Color> _colors = [
    Colors.blue.shade100,
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.blue.shade600,
  ];
  int _slot = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Listener(
        onPointerMove: (PointerMoveEvent event) {
          //print('${event.position}');
          final y = event.position.dy;
          // print('position: $y');
          if (y > (_slot + 1) * 88) {
            // print("------------> $_slot");
            if (_slot == _colors.length - 1) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot + 1];
              _colors[_slot + 1] = c;
              _slot++;
            });
          } else if (y < _slot * 88) {
            // print("------------> $_slot");
            if (_slot == 0) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot - 1];
              _colors[_slot - 1] = c;
              _slot--;
            });
          }
        },
        child: Stack(
            children: List.generate(_colors.length, (index) {
              return Box(
                color: _colors[index],
                index: index,
                onDragEnd: (DraggableDetails details) {
                  print("$index  is onDragEnd  ${details.offset}");

                  // Future.delayed(Duration(seconds: 2), () {
                  //   setState(() {
                  //     final c = _colors[2];
                  //     _colors[2] = _colors[3];
                  //     _colors[3] = c;
                  //   });
                  // });
                },
                onDragStarted: (color) {
                  _slot = _colors.indexOf(color);
                  print(
                      "----------------------${_colors.indexOf(color)}  is onDragStarted");
                },
                key: ValueKey(_colors[index]),
              );
            })),
      ),
      // body: ReorderableListView(
      //   onReorder: (int oldIndex, int newIndex) {
      //     if (newIndex > oldIndex) newIndex--;
      //     Widget box = boxs.removeAt(oldIndex);
      //     boxs.insert(newIndex, box);
      //   },
      //   children: boxs,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _colors.shuffle();
          });
        },
        child: const Icon(
          Icons.refresh,
          size: 40,
        ),
      ),
    );
  }
}