import 'package:flutter/material.dart';

import '../../position/tooltip_position.dart';

enum ZeroTooltipVariant {
  rectangle,
  rounded,
  custom;

  CustomPainter toPainter({
    Color backgaroundColor = Colors.black54,
    Color borderColor = Colors.transparent,
    ZeroTooltipPosition position = ZeroTooltipPosition.top,
  }) {
    switch (this) {
      case ZeroTooltipVariant.rectangle:
        return ZeroTooltipRectangleVariant(
          backgaroundColor: backgaroundColor,
          borderColor: borderColor,
          position: position,
        );
      case ZeroTooltipVariant.rounded:
        return ZeroTooltipRoundedVariant(
          backgaroundColor: backgaroundColor,
          borderColor: borderColor,
          position: position,
        );
      case ZeroTooltipVariant.custom:
        return ZeroTooltipCustomVariant(
          backgaroundColor: backgaroundColor,
          borderColor: borderColor,
          position: position,
        );
    }
  }
}

class ZeroTooltipRectangleVariant extends CustomPainter {
  final Color backgaroundColor;
  final Color borderColor;
  final ZeroTooltipPosition position;
  final ZeroTooltipVariant variant;
  const ZeroTooltipRectangleVariant({
    this.variant = ZeroTooltipVariant.rectangle,
    this.backgaroundColor = Colors.black54,
    this.borderColor = Colors.transparent,
    this.position = ZeroTooltipPosition.top,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = backgaroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final double width = size.width;
    final double height = size.height;

    late Path fillPath;
    late Path borderPath;

    final BorderRadius borderRadius = BorderRadius.circular(2);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);

    switch (position) {
      case ZeroTooltipPosition.top:
        fillPath = Path()..addRRect(outer);
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.bottom:
        fillPath = Path()..addRRect(outer);
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.left:
        fillPath = Path()..addRRect(outer);
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.right:
        fillPath = Path()..addRRect(outer);
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
    }
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ZeroTooltipCustomVariant extends CustomPainter {
  final Color backgaroundColor;
  final Color borderColor;
  final ZeroTooltipPosition position;
  final ZeroTooltipVariant variant;
  const ZeroTooltipCustomVariant({
    this.variant = ZeroTooltipVariant.rectangle,
    this.backgaroundColor = Colors.black54,
    this.borderColor = Colors.transparent,
    this.position = ZeroTooltipPosition.top,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = backgaroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const double triangleH = 6;
    const double triangleW = 15;
    final double width = size.width;
    final double height = size.height;

    late Path fillPath;
    late Path borderPath;

    final BorderRadius borderRadius = BorderRadius.circular(2);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);

    switch (position) {
      case ZeroTooltipPosition.top:
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(width / 2 - triangleW / 2, height)
            ..lineTo(width / 2, height + triangleH)
            ..lineTo(width / 2 + triangleW / 2, height)
            ..lineTo(width / 2 - triangleW / 2, height),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.bottom:
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(width / 2 - triangleW / 2, 0)
            ..lineTo(width / 2, 0 - triangleH)
            ..lineTo(width / 2 + triangleW / 2, 0)
            ..lineTo(width / 2 - triangleW / 2, 0),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.left:
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(width, height / 2 - triangleW / 2)
            ..lineTo(width + triangleH, height / 2)
            ..lineTo(width, height / 2 + triangleW / 2)
            ..lineTo(width, height / 2 - triangleW / 2),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.right:
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(0, height / 2 - triangleW / 2)
            ..lineTo(0 - triangleH, height / 2)
            ..lineTo(0, height / 2 + triangleW / 2)
            ..lineTo(0, height / 2 - triangleW / 2),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
    }
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ZeroTooltipRoundedVariant extends CustomPainter {
  final Color backgaroundColor;
  final Color borderColor;
  final ZeroTooltipPosition position;
  final ZeroTooltipVariant variant;
  const ZeroTooltipRoundedVariant({
    this.variant = ZeroTooltipVariant.rectangle,
    this.backgaroundColor = Colors.black54,
    this.borderColor = Colors.transparent,
    this.position = ZeroTooltipPosition.top,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()
      ..color = backgaroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const double width = 35;
    const double height = 35;
    const double triangleH = 8;
    const double triangleW = width;

    late Path fillPath;
    late Path borderPath;

    final BorderRadius borderRadius = BorderRadius.circular(50);
    final Rect rect;
    final RRect outer;

    switch (position) {
      case ZeroTooltipPosition.top:
        rect = const Rect.fromLTRB(0, 0, width, height);
        outer = borderRadius.toRRect(rect);
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..moveTo(2, height - (height / 4))
            ..lineTo(width / 2, height + triangleH)
            ..lineTo(width - 2, height - (height / 4)),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.bottom:
        rect = const Rect.fromLTRB(0, 0, width, height);
        outer = borderRadius.toRRect(rect);
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..moveTo(2, height / 4)
            ..lineTo(width / 2, 0 - triangleH)
            ..lineTo(width - 2, height / 4),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.left:
        rect = const Rect.fromLTRB(0, 0, width, height);
        outer = borderRadius.toRRect(rect);
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(width - (width / 4), 2)
            ..lineTo(width + (triangleW / 5), height / 2)
            ..lineTo(width - (width / 4), height - 2)
            ..lineTo(width - (width / 4), 2),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
      case ZeroTooltipPosition.right:
        rect = const Rect.fromLTRB(0, 0, width, height);
        outer = borderRadius.toRRect(rect);
        fillPath = Path.combine(
          PathOperation.union,
          Path()..addRRect(outer),
          Path()
            ..addRRect(outer)
            ..moveTo(width / 4, 2)
            ..lineTo(0 - (triangleW / 5), height / 2)
            ..lineTo(width / 4, height - 2)
            ..lineTo(width / 4, 2),
        );
        borderPath = Path()..addPath(fillPath, Offset.zero);
        break;
    }
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
