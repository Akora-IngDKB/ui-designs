import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const PageIndicator(this.currentIndex, {this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(itemCount, (i) {
        return Container(
          height: 8,
          width: i == currentIndex ? 24 : 8,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: i == currentIndex ? BoxShape.rectangle : BoxShape.circle,
            color: Colors.deepOrange.withOpacity(i == currentIndex ? 1.0 : 0.4),
            borderRadius:
                i == currentIndex ? BorderRadius.all(Radius.circular(4)) : null,
          ),
        );
      }),
    );
  }
}
