import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

part 'animate_icons.dart';
part 'zero_speed_dial_alignment.dart';
part 'zero_speed_dial_item.dart';

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

  final Brightness? tooltipBrightness;

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
    this.tooltipBrightness,
    this.direction = ZeroSpeedDialDirection.vertical,
    this.curve = Curves.easeOutCubic,
    this.duration = const Duration(milliseconds: 400),
    this.label,
  });

  @override
  State<ZeroSpeedDial> createState() => _ZeroSpeedDialState();
}

class _ZeroSpeedDialState extends State<ZeroSpeedDial>
    with SingleTickerProviderStateMixin {
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

  _AnimateIconController animateIconoController = _AnimateIconController();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeStyle = theme.speedDialStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);
    final children = widget.children;

    double offset = (adaptiveStyle.size ?? 0) + (adaptiveStyle.spacing ?? 0);
    ScaffoldState? scaffold = Scaffold.of(context);
    FloatingActionButtonLocation location =
        scaffold.widget.floatingActionButtonLocation ??
            FloatingActionButtonLocation.endFloat;
    double adjustTopPositioning = (MediaQuery.of(context).size.height / 2 -
        (adaptiveStyle.size ?? 0) / 2);
    double adjustHorizontalPositioningForLabel = widget.label == null
        ? 0
        : _dynamicButtonWidth - (adaptiveStyle.size ?? 0);

    final ZeroSpeedDialDirection direction = location.isCenter()
        ? ZeroSpeedDialDirection.vertical
        : widget.direction;

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
                    ? (showChildren ? offset * (index + 1) : 0) +
                        adjustTopPositioning
                    : null
                : null,
            left: direction == ZeroSpeedDialDirection.horizontal
                ? location.isLeft()
                    ? showChildren
                        ? offset * (index + 1) +
                            adjustHorizontalPositioningForLabel
                        : 0
                    : null
                : null,
            right: direction == ZeroSpeedDialDirection.horizontal
                ? location.isLeft()
                    ? null
                    : showChildren
                        ? offset * (index + 1) +
                            adjustHorizontalPositioningForLabel
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
                    tooltipBrightness: widget.tooltipBrightness,
                    variant:
                        widget.tooltipVariant ?? ZeroTooltipVariant.rectangle,
                    tooltipStyle: adaptiveStyle.tooltipStyle,
                    position: direction == ZeroSpeedDialDirection.vertical
                        ? location.isLeft()
                            ? ZeroTooltipPosition.right
                            : ZeroTooltipPosition.left
                        : location.isTop()
                            ? ZeroTooltipPosition.bottom
                            : ZeroTooltipPosition.top,
                    direction: direction,
                    backgroundColor: children[index].backgroundColor ??
                        context.theme.scaffoldBackgroundColor,
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
                  color: showChildren
                      ? adaptiveStyle.activeColor
                      : adaptiveStyle.inactiveColor,
                  borderRadius: adaptiveStyle.borderRadius,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: adaptiveStyle.size!,
                  ),
                  child: SizedBox(
                    height: adaptiveStyle.size,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: adaptiveStyle.size! / 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _AnimateIcons(
                            active:
                                widget.activeChild ?? const Icon(Icons.close),
                            inactive:
                                widget.inactiveChild ?? const Icon(Icons.add),
                            controller: animateIconoController,
                            duration: widget.duration,
                            clockwise: true,
                          ),
                          if (widget.label != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: adaptiveStyle.size! / 8,
                              ),
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
