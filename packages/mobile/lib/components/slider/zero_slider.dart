import 'package:flutter/material.dart';

import '../tooltip/zero_tooltip.dart';
import '../tooltip/zero_tooltip_style.dart';

class ZeroSlider extends StatefulWidget {
  const ZeroSlider({super.key});

  @override
  State<ZeroSlider> createState() => _ZeroSliderState();
}

class _ZeroSliderState extends State<ZeroSlider> {
  final GlobalKey _widgetKey = GlobalKey();
  double _distance = 0.0;
  double _percentage = 0.0;

  late Function _tooltipController;

  _onRatingDragUpdate(DragUpdateDetails details) {
    /// -20 is the padding of the container
    /// this for calibrate the point when dragging
    double newDistance = details.localPosition.dx - 20;
    if (newDistance < 0) {
      newDistance = 0;
    } else if (newDistance > _widgetKey.currentContext!.size!.width) {
      newDistance = _widgetKey.currentContext!.size!.width;
    }
    setState(() {
      _distance = newDistance;
      _percentage = _distance / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _tooltipController(true);
        _onRatingDragUpdate(details);
      },
      onHorizontalDragEnd: (details) {
        _tooltipController(false);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Container(
              key: _widgetKey,
              width: 200,
              height: 4,
              color: Colors.amber.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Container(
              width: _distance,
              height: 4,
              color: Colors.amber.withOpacity(1),
            ),
          ),
          Positioned(
            top: 0,
            left: _distance,
            child: ZeroTooltip(
              backgaroundColor: Colors.amber.withOpacity(0.8),
              variant: ZeroTooltipVariant.rounded,
              onCreated: (controller) {
                _tooltipController = controller;
              },
              text: _percentage.toStringAsFixed(0),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                highlightColor: Colors.amber.withOpacity(0.2),
                splashColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
