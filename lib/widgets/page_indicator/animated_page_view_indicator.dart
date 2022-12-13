//

import 'package:flutter/material.dart';

class AnimatedPageViewIndicator extends StatelessWidget {
  const AnimatedPageViewIndicator({
    Key? key,
    required this.pageCount,
    required this.animation,
  }) : super(key: key);

  final int pageCount;
  final PageController animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          painter: PageIndicatorPainter(
            pageCount: pageCount,
            dotRadiud: 10,
            dotOutlineThikness: 3,
            spacing: 25,
            scrollPosition: animation.hasClients ? (animation.page ?? 0) : 0,
            fillColor: Colors.green.shade200,
            strokeColor: Colors.green.shade900,
            indicatorColor: Colors.blueAccent,
          ),
        );
      },
    );
  }
}

class PageIndicatorPainter extends CustomPainter {
  final int pageCount;
  final double dotRadiud;
  final double dotOutlineThikness;
  final double spacing;
  final double scrollPosition;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  PageIndicatorPainter({
    required this.pageCount,
    required this.dotRadiud,
    required this.dotOutlineThikness,
    required this.spacing,
    required this.scrollPosition,
    required Color fillColor,
    required Color strokeColor,
    required Color indicatorColor,
  })  : dotFillPaint = Paint()..color = fillColor,
        dotOutlinePaint = Paint()..color = strokeColor,
        indicatorPaint = Paint()..color = indicatorColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth =
        (pageCount * (2 * dotRadiud)) + ((pageCount - 1) * spacing);
    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final int pageToLeftIndex = scrollPosition.floor();
    final double leftDotX = (center.dx - (totalWidth / 2)) +
        (pageToLeftIndex * ((2 * dotRadiud) + spacing));
    final double transitionPercent = scrollPosition - pageToLeftIndex;

    final double laggingLeftPositionPercent =
        (transitionPercent - 0.3).clamp(0, 1) / 0.7;

    final double indicatorLeftX =
        leftDotX + (laggingLeftPositionPercent * ((2 * dotRadiud) + spacing));

    final double acceleratedRightPositionPercent =
        (transitionPercent / 0.5).clamp(0, 1.0);
    final double indicatorRightX = leftDotX +
        (acceleratedRightPositionPercent * ((2 * dotRadiud) + spacing)) +
        (2 * dotRadiud);

    canvas.drawRRect(
      RRect.fromLTRBR(
        indicatorLeftX,
        -dotRadiud,
        indicatorRightX,
        dotRadiud,
        Radius.circular(dotRadiud),
      ),
      indicatorPaint,
    );
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadiud, 0);
    for (int i = 0; i < pageCount; i++) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadiud) + spacing, 0);
    }
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadiud - dotOutlineThikness, dotFillPaint);
    Path outlinePath = Path()
      ..addOval(Rect.fromCircle(center: dotCenter, radius: dotRadiud))
      ..addOval(Rect.fromCircle(
          center: dotCenter, radius: dotRadiud - dotOutlineThikness))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(outlinePath, dotOutlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
