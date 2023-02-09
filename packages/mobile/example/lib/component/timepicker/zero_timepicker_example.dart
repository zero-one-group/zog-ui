import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

extension on num {
  /// This is an extension we created so we can easily convert a value  /// to a radian value
  double get radians => (this * math.pi) / 180.0;
}

class ZeroTimePickerExample extends StatelessWidget {
  const ZeroTimePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker')),
      body: Center(
        child: ZeroButton.primary(
          onPressed: () => showZeroTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!),
          ),
          text: 'Time Picker Example',
        ),
      ),
    );

    // return Scaffold(
    //   body: CustomPaint(
    //     size: size,
    //     painter: PlaygroundPainter(),
    //   ),
    // );
  }
}

class PlaygroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// We shift the coordinates to the center of the screen
    canvas.translate(size.width / 2, size.height / 2);

    // Total angle of a circle is 360
    const totalDegree = 360;

    // Total ticks to display
    const totalTicks = 12;

    /// The angle between each tick
    const unitAngle = totalDegree / totalTicks;

    final clockPaint = Paint()
      ..color = Colors.red[900]!.withOpacity(.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    /// Draws the clock circle frame
    canvas.drawCircle(
      Offset.zero,
      90,
      clockPaint,
    );

    /// Draws the clock hour hand
    canvas.drawLine(
      Offset.zero,
      Offset.fromDirection(math.pi, 40),
      Paint()
        ..color = Colors.red[400]!
        ..strokeWidth = 4,
    );

    /// Draws the clock minute hand
    canvas.drawLine(
      Offset.zero,
      Offset.fromDirection(-math.pi / 2, 60),
      Paint()
        ..color = Colors.red[400]!
        ..strokeWidth = 4,
    );

    /// Draws the center smaller circle
    canvas.drawCircle(
      Offset.zero,
      6,
      clockPaint
        ..style = PaintingStyle.fill
        ..color = Colors.red[900]!,
    );

    for (int i = 0; i <= 11; i++) {
      /// calculates the angle of each tick index
      /// reason for adding 90 degree to the angle is
      /// so that the ticks starts from
      final angle = -90.radians + (i * unitAngle).radians;

      /// Draws the tick for each angle
      canvas.drawLine(
        Offset.fromDirection(angle, 70),
        Offset.fromDirection(angle, 80),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 4,
      );
    }
  }

  /// Since this is a static drawing, we set this to false
  @override
  bool shouldRepaint(PlaygroundPainter oldDelegate) => false;
}
