import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum _ProgressType { linear, circular }

/// [ZeroProgressIndicator] is a widget that shows a progress indicator which is similar to [LinearProgressIndicator] and [CircularProgressIndicator].
/// this widget have two types of progress indicator which is [linear] and [circular].
///
/// [linear] is a widget that shows a progress indicator in a horizontal line.
/// [circular] is a widget that shows a progress indicator in a circle.
class ZeroProgressIndicator extends StatelessWidget {
  final double? value;
  final _ProgressType? _type;
  final ZeroProgressStyle? style;

  const ZeroProgressIndicator.linear({
    Key? key,
    this.value,
    this.style,
  })  : _type = _ProgressType.linear,
        super(key: key);

  const ZeroProgressIndicator.circular({
    Key? key,
    this.value,
    this.style,
  })  : _type = _ProgressType.circular,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.progressStyle;
    final adaptiveStyle = themeStyle.merge(style);

    if (_type == _ProgressType.linear) {
      return LinearProgressIndicator(
        value: value,
        backgroundColor: adaptiveStyle.backgroundColor,
        valueColor: adaptiveStyle.valueColor == null
            ? null
            : AlwaysStoppedAnimation<Color>(adaptiveStyle.valueColor!),
        minHeight: adaptiveStyle.lineSize,
      );
    }

    return CircularProgressIndicator(
      key: key,
      value: value,
      backgroundColor: adaptiveStyle.backgroundColor,
      valueColor: adaptiveStyle.valueColor == null
          ? null
          : AlwaysStoppedAnimation<Color>(adaptiveStyle.valueColor!),
      strokeWidth: adaptiveStyle.lineSize ?? 4,
    );
  }
}
