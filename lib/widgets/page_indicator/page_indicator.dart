//

import 'package:flutter/material.dart';

class PageIndicatorView extends StatelessWidget {
  const PageIndicatorView({
    Key? key,
    required this.pageCount,
    required this.selectedPage,
    this.minSize = 8,
    this.maxSize = 12,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);
  final int pageCount;
  final int selectedPage;
  final double minSize;
  final double maxSize;
  final Color activeColor;
  final Color inactiveColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < pageCount; i++)
          if (selectedPage == i)
            PageIndicatorDotView(
              isActive: true,
              minSize: minSize,
              maxSize: maxSize,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
            )
          else
            PageIndicatorDotView(
              isActive: false,
              minSize: minSize,
              maxSize: maxSize,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
            )
      ],
    );
  }
}

class PageIndicatorDotView extends StatelessWidget {
  const PageIndicatorDotView({
    Key? key,
    required this.isActive,
    required this.minSize,
    required this.maxSize,
    required this.activeColor,
    required this.inactiveColor,
  }) : super(key: key);
  final bool isActive;
  final double minSize;
  final double maxSize;
  final Color activeColor;
  final Color inactiveColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: isActive ? maxSize : minSize,
      height: isActive ? maxSize : minSize,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: (isActive == true) ? activeColor : inactiveColor,
      ),
    );
  }
}
