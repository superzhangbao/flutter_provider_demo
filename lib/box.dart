import 'package:flutter/cupertino.dart';

class Box extends StatelessWidget {
  final Color color;
  final int index;
  final Function(Color) onDragStarted;
  final Function(DraggableDetails details) onDragEnd;
  const Box(
      {required Key key,
        required this.color,
        required this.index,
        required this.onDragStarted,
        required this.onDragEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 188,
      top: index * 88,
      child: Draggable(
        onDragStarted: () {
          onDragStarted(color);
        },
        onDragEnd: onDragEnd,
        //被拖动的时候 和手势一起移动的
        feedback: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),

        //被拖动的时候 之前位置所显示的
        childWhenDragging: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Colors.grey,
            // color: color.withOpacity(0.5),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
        ),
      ),
      duration: Duration(milliseconds: 250),
    );
  }
}
