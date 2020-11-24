import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const PageIndicator(this.currentIndex, {this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(itemCount, (i) {
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                height: 8,
                width: i == currentIndex ? 24 : 8,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color:
                      Colors.orange.withOpacity(i == currentIndex ? 1.0 : 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              );
            }),
          ),
          if (currentIndex != itemCount - 1)
            Text(
              'Skip',
              style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
