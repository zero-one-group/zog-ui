import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';
import 'dart:math' as math;

class ZeroSpeedDial extends StatefulWidget {
  /// [activeChild] is widget that will be shown when the floating button is tapped and the children are shown.
  final Widget? activeChild;

  /// [inactiveChild] is widget that will be shown when the floating button is tapped and the children are hidden.
  final Widget? inactiveChild;

  /// [children] ia a list of [ZeroSpeedDialItem] that will shown when floating button is tapped.
  final List<ZeroSpeedDialItem> children;

  /// [style] is a styling for speed dial
  final ZeroSpeedDialStyle? style;

  /// [tooltipVariant] is a variant for children tooltip
  /// by default it will be [ZeroTooltipVariant.custom]
  /// if you want to use rectangle tooltip, you can set it to [ZeroTooltipVariant.rectangle]
  final ZeroTooltipVariant? tooltipVariant;

  /// [tooltipType] is a type for children tooltip
  /// by default it will be [ZeroTooltipType.dark]
  /// if you want to use light tooltip, you can set it to [ZeroTooltipType.light]
  final ZeroTooltipType? tooltipType;

  /// [direction] is a direction for children expansion
  /// by default it will be [ZeroSpeedDialDirection.vertical]
  /// if you want to use horizontal expansion, you can set it to [ZeroSpeedDialDirection.horizontal]
  final ZeroSpeedDialDirection direction;

  /// [curve] is a curve for children expansion animation
  /// by default it will be [Curves.easeOutCubic]
  /// if you want to use other curve, you can set it to other [Curve]
  final Curve curve;

  /// [duration] is a duration for children expansion animation
  /// by default it will be 400 milliseconds
  final Duration duration;

  final Text? label;

  const ZeroSpeedDial({
    super.key,
    this.activeChild,
    this.inactiveChild,
    this.children = const [],
    this.style,
    this.tooltipVariant,
    this.tooltipType,
    this.direction = ZeroSpeedDialDirection.vertical,
    this.curve = Curves.easeOutCubic,
    this.duration = const Duration(milliseconds: 400),
    this.label,
  });

  @override
  State<ZeroSpeedDial> createState() => _ZeroSpeedDialState();
}

class _ZeroSpeedDialState extends State<ZeroSpeedDial> with SingleTickerProviderStateMixin {
  /// [showChildren] is a state for showing children
  bool showChildren = false;

  /// to get dynamic size of button if it is expanded by label
  final GlobalKey _buttonKey = GlobalKey();
  double _dynamicButtonWidth = 0;

  /// function for handling tap event
  void _onTap() {
    _dynamicButtonWidth = _buttonKey.currentContext!.size!.width;
    if (showChildren) {
      setState(() {
        showChildren = false;
      });
      animateIconoController.animateToStart();
    } else {
      setState(() {
        showChildren = true;
      });
      animateIconoController.animateToEnd();
    }
  }

  AnimateIconController animateIconoController = AnimateIconController();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeStyle = theme.speedDialStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);
    final children = widget.children;

    double offset = (adaptiveStyle.size ?? 0) + (adaptiveStyle.spacing ?? 0);
    ScaffoldState? scaffold = Scaffold.of(context);
    FloatingActionButtonLocation location = scaffold.widget.floatingActionButtonLocation ?? FloatingActionButtonLocation.endFloat;
    double adjustTopPositioning = (MediaQuery.of(context).size.height / 2 - (adaptiveStyle.size ?? 0) / 2);
    double adjustHorizontalPositioningForLabel = widget.label == null ? 0 : _dynamicButtonWidth - (adaptiveStyle.size ?? 0);

    final ZeroSpeedDialDirection direction = location.isCenter() ? ZeroSpeedDialDirection.vertical : widget.direction;

    return Stack(
      alignment: location.getAlignment(),
      clipBehavior: Clip.none,
      children: [
        ...List.generate(children.length, (index) {
          return AnimatedPositioned(
            bottom: direction == ZeroSpeedDialDirection.vertical
                ? location.isTop()
                    ? null
                    : showChildren
                        ? offset * (index + 1)
                        : 0
                : null,
            top: direction == ZeroSpeedDialDirection.vertical
                ? location.isTop()
                    ? (showChildren ? offset * (index + 1) : 0) + adjustTopPositioning
                    : null
                : null,
            left: direction == ZeroSpeedDialDirection.horizontal
                ? location.isLeft()
                    ? showChildren
                        ? offset * (index + 1) + adjustHorizontalPositioningForLabel
                        : 0
                    : null
                : null,
            right: direction == ZeroSpeedDialDirection.horizontal
                ? location.isLeft()
                    ? null
                    : showChildren
                        ? offset * (index + 1) + adjustHorizontalPositioningForLabel
                        : 0
                : null,
            curve: widget.curve,
            duration: widget.duration,
            child: AnimatedOpacity(
              opacity: showChildren ? 1 : 0,
              duration: const Duration(milliseconds: 150),
              child: Material(
                elevation: adaptiveStyle.elevation ?? 4,
                shadowColor: adaptiveStyle.shadowColor,
                borderRadius: adaptiveStyle.borderRadius,
                child: Container(
                  width: adaptiveStyle.size,
                  height: adaptiveStyle.size,
                  decoration: BoxDecoration(
                    borderRadius: adaptiveStyle.borderRadius,
                  ),
                  child: _SpeedDialItem(
                    onTap: children[index].onTap,
                    tooltipText: children[index].tooltipText,
                    size: adaptiveStyle.size ?? 0,
                    location: location,
                    tooltipBackgroundColor: adaptiveStyle.tooltipBackgroundColor,
                    tooltipBorderColor: adaptiveStyle.tooltipBorderColor,
                    variant: widget.tooltipVariant ?? ZeroTooltipVariant.rectangle,
                    position: direction == ZeroSpeedDialDirection.vertical
                        ? location.isLeft()
                            ? ZeroTooltipPosition.right
                            : ZeroTooltipPosition.left
                        : location.isTop()
                            ? ZeroTooltipPosition.bottom
                            : ZeroTooltipPosition.top,
                    direction: direction,
                    backgroundColor: children[index].backgroundColor ?? context.theme.scaffoldBackgroundColor,
                    type: widget.tooltipType ?? ZeroTooltipType.dark,
                    borderRadius: adaptiveStyle.borderRadius!,
                    child: children[index].child,
                  ),
                ),
              ),
            ),
          );
        }).reversed.toList(),
        Align(
          alignment: location.getAlignment(),
          child: InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            key: _buttonKey,
            onTap: _onTap,
            child: Material(
              elevation: adaptiveStyle.elevation ?? 4,
              shadowColor: adaptiveStyle.shadowColor,
              borderRadius: adaptiveStyle.borderRadius,
              child: Container(
                decoration: BoxDecoration(
                  color: showChildren ? adaptiveStyle.activeColor : adaptiveStyle.inactiveColor,
                  borderRadius: adaptiveStyle.borderRadius,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: adaptiveStyle.size!,
                  ),
                  child: SizedBox(
                    height: adaptiveStyle.size,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: adaptiveStyle.size! / 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _AnimateIcons(
                            active: widget.activeChild ?? const Icon(Icons.close),
                            inactive: widget.inactiveChild ?? const Icon(Icons.add),
                            controller: animateIconoController,
                            duration: widget.duration,
                            clockwise: true,
                          ),
                          if (widget.label != null)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: adaptiveStyle.size! / 8),
                              child: widget.label,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// [ZeroSpeedDialItem] is a class for creating speed dial item
class ZeroSpeedDialItem {
  final Text? tooltipText;
  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  const ZeroSpeedDialItem({
    this.tooltipText,
    required this.child,
    this.onTap,
    this.backgroundColor,
  });
}

class _SpeedDialItem extends StatelessWidget {
  final Text? tooltipText;
  final Widget child;
  final Function()? onTap;
  final double size;
  final FloatingActionButtonLocation location;
  final ZeroTooltipType type;
  final ZeroTooltipVariant variant;
  final ZeroTooltipPosition position;
  final Color tooltipBackgroundColor;
  final Color tooltipBorderColor;
  final Color backgroundColor;
  final ZeroSpeedDialDirection direction;
  final BorderRadius borderRadius;

  _SpeedDialItem({
    this.tooltipText,
    required this.child,
    this.onTap,
    this.size = 56,
    required this.location,
    this.variant = ZeroTooltipVariant.rectangle,
    required this.position,
    Color? tooltipBackgroundColor,
    Color? tooltipBorderColor,
    required this.backgroundColor,
    required this.type,
    required this.direction,
    required this.borderRadius,
  })  : tooltipBackgroundColor = tooltipBackgroundColor ?? type.backgroundColor,
        tooltipBorderColor = tooltipBorderColor ?? type.borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: onTap,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width: size,
              height: size,
              color: backgroundColor,
              child: Center(child: child),
            ),
          ),
        ),
        if (tooltipText != null)
          Positioned(
            right: direction == ZeroSpeedDialDirection.vertical
                ? location.isLeft()
                    ? null
                    : size * 1.2
                : null,
            left: direction == ZeroSpeedDialDirection.vertical
                ? location.isLeft()
                    ? size * 1.2
                    : null
                : null,
            top: direction == ZeroSpeedDialDirection.horizontal
                ? location.isTop()
                    ? size * 1.2
                    : null
                : null,
            bottom: direction == ZeroSpeedDialDirection.horizontal
                ? location.isTop()
                    ? null
                    : size * 1.2
                : null,
            child: CustomPaint(
              painter: variant.toPainter(
                backgroundColor: tooltipBackgroundColor,
                position: position,
                borderColor: tooltipBorderColor,
              ),
              child: Padding(
                padding: variant == ZeroTooltipVariant.rounded
                    ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                    : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: DefaultTextStyle(
                  style: TextStyle(color: type.textColor),
                  child: Center(
                    child: variant == ZeroTooltipVariant.rounded
                        ? SizedBox(
                            width: 35,
                            child: tooltipText,
                          )
                        : tooltipText,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// extension for [FloatingActionButtonLocation]
/// to get alignment of [FloatingActionButton]
/// based on [FloatingActionButtonLocation]
extension _GetAlignment on FloatingActionButtonLocation {
  AlignmentGeometry getAlignment() {
    switch (this) {
      case FloatingActionButtonLocation.endContained:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.endDocked:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.endFloat:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.centerDocked:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.centerFloat:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniCenterDocked:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniCenterFloat:
        return Alignment.bottomCenter;

      case FloatingActionButtonLocation.miniEndDocked:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.miniEndFloat:
        return Alignment.bottomRight;

      case FloatingActionButtonLocation.miniStartDocked:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.miniStartFloat:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.startDocked:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.startFloat:
        return Alignment.bottomLeft;

      case FloatingActionButtonLocation.endTop:
        return Alignment.centerRight;

      case FloatingActionButtonLocation.centerTop:
        return Alignment.center;

      case FloatingActionButtonLocation.startTop:
        return Alignment.centerLeft;

      default:
        return Alignment.bottomRight;
    }
  }

  bool isTop() {
    switch (this) {
      case FloatingActionButtonLocation.endTop:
        return true;

      case FloatingActionButtonLocation.centerTop:
        return true;

      case FloatingActionButtonLocation.startTop:
        return true;

      default:
        return false;
    }
  }

  bool isLeft() {
    switch (this) {
      case FloatingActionButtonLocation.startDocked:
        return true;

      case FloatingActionButtonLocation.startFloat:
        return true;

      case FloatingActionButtonLocation.miniStartDocked:
        return true;

      case FloatingActionButtonLocation.miniStartFloat:
        return true;

      case FloatingActionButtonLocation.startTop:
        return true;

      default:
        return false;
    }
  }

  bool isCenter() {
    switch (this) {
      case FloatingActionButtonLocation.centerDocked:
        return true;

      case FloatingActionButtonLocation.centerFloat:
        return true;

      case FloatingActionButtonLocation.miniCenterDocked:
        return true;

      case FloatingActionButtonLocation.miniCenterFloat:
        return true;

      case FloatingActionButtonLocation.centerTop:
        return true;

      default:
        return false;
    }
  }
}

/// widget to animate between two icons when button is tapped
class _AnimateIcons extends StatefulWidget {
  final Widget active, inactive;
  final Duration duration;
  final bool? clockwise;
  final AnimateIconController controller;
  const _AnimateIcons({
    required this.active,
    required this.inactive,
    required this.controller,
    this.duration = const Duration(milliseconds: 400),
    this.clockwise,
  });

  @override
  _AnimateIconsState createState() => _AnimateIconsState();
}

class _AnimateIconsState extends State<_AnimateIcons> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    initControllerFunctions();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  initControllerFunctions() {
    widget.controller.animateToEnd = () {
      if (mounted) {
        _controller.forward();
        return true;
      } else {
        return false;
      }
    };
    widget.controller.animateToStart = () {
      if (mounted) {
        _controller.reverse();
        return true;
      } else {
        return false;
      }
    };
    widget.controller.isStart = () => _controller.value == 0.0;
    widget.controller.isEnd = () => _controller.value == 1.0;
  }

  @override
  Widget build(BuildContext context) {
    double x = _controller.value;
    double y = 1.0 - _controller.value;
    double angleX = math.pi / 180 * (180 * x);
    double angleY = math.pi / 180 * (180 * y);

    Widget first() {
      return Transform.rotate(
        angle: widget.clockwise ?? false ? angleX : -angleX,
        child: Opacity(
          opacity: y,
          child: widget.inactive,
        ),
      );
    }

    Widget second() {
      return Transform.rotate(
        angle: widget.clockwise ?? false ? -angleY : angleY,
        child: Opacity(
          opacity: x,
          child: widget.active,
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        x == 1 && y == 0 ? second() : first(),
        x == 0 && y == 1 ? first() : second(),
      ],
    );
  }
}

class AnimateIconController {
  late bool Function() animateToStart, animateToEnd;
  late bool Function() isStart, isEnd;
}
