import 'package:flutter/material.dart';

class CustomCircleTabIndicator extends Decoration {
  CustomCircleTabIndicator({required Color color, required double radius}) : _painter = _CirclePainter(color, radius);

  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([void onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  final Paint _paint;
  final double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
