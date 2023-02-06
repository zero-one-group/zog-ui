import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// A class that provides a function to display a alert message
/// [ZeroSnackbarAlert] have 2 methods:
/// - [show] to display a alert message
/// - [hide] to hide a alert message
/// the alert default duration is 2 seconds and can be changed by passing a [Duration] to the [show] method
class ZeroSnackbarAlert {
  ZeroSnackbarAlert._();
  static final ZeroSnackbarAlert _instance = ZeroSnackbarAlert._();
  factory ZeroSnackbarAlert() => _instance;
  OverlayEntry? _overlayEntry;

  /// [show] is a function that displays a alert message
  void show(
    BuildContext context, {
    /// [title] the title of the alert
    required String title,

    /// [subtitle] the subtitle of the alert
    required String subtitle,

    /// [variant] the variant of the alert (danger, warning, success, info)
    ZeroSnackbarAlertVariant variant = ZeroSnackbarAlertVariant.danger,

    /// [type] the type of the alert (solidFilled, outline, filled)
    ZeroSnackbarAlertType type = ZeroSnackbarAlertType.solidFilled,

    /// [duration] the duration of the alert, duration can be zero which will make the alert permanent
    Duration? duration,

    /// [actionWidget] additional widget to display on the right side of the alert
    Widget? actionWidget,

    /// [backgroundColor] the background color of the alert
    Color? backgroundColor,

    /// [iconColor] the color of right icon of the alert
    Color? iconColor,

    /// [border] the border of the alert
    BoxBorder? border,

    /// [titleTextStyle] the text style of the title
    TextStyle? titleTextStyle,

    /// [subtitleTextStyle] the text style of the subtitle
    TextStyle? subtitleTextStyle,

    /// [position] the position of the alert (top, bottom, center)
    SnackbarPosition position = SnackbarPosition.bottom,
  }) {
    /// if the alert is already displayed, [_overlayEntry] cannot create a new alert
    if (_overlayEntry != null) return;

    /// create a new alert
    _overlayEntry = OverlayEntry(builder: (context) {
      return SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Align(
              alignment: position.alignment,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: border ?? _border(variant, type),
                    color: backgroundColor ?? _getBackgroundColor(variant, type),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          variant.icon,
                          color: iconColor ?? _iconColor(variant, type),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextStyle(
                              style: TextStyle(color: _titleColor(variant, type), fontSize: 16, fontWeight: FontWeight.w600)
                                  .merge(titleTextStyle),
                              child: Text(
                                title,
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(color: _subtitleColor(variant, type), fontSize: 14).merge(subtitleTextStyle),
                              child: Text(
                                subtitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: actionWidget ?? const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
    Overlay.of(context, rootOverlay: false).insert(_overlayEntry!);

    /// hide the alert after the duration
    /// if the duration is zero, the alert will be permanent
    /// if the duration is null, the alert will be displayed for 2 seconds
    duration == Duration.zero
        ? null
        : Future.delayed(duration ?? const Duration(seconds: 2), () {
            hide();
          });
  }

  /// [_border] return the border of the alert
  /// border only for [ZeroSnackbarAlertType.outlined]
  BoxBorder _border(ZeroSnackbarAlertVariant variant, ZeroSnackbarAlertType type) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Border.all(color: Colors.transparent);
      case ZeroSnackbarAlertType.filled:
        return Border.all(color: Colors.transparent);
      case ZeroSnackbarAlertType.outlined:
        return Border.all(color: variant.color);
    }
  }

  /// [_iconColor] return the color of the icon
  /// icon color only for [ZeroSnackbarAlertType.outlined]
  Color _iconColor(ZeroSnackbarAlertVariant variant, ZeroSnackbarAlertType type) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Colors.white;
      case ZeroSnackbarAlertType.filled:
        return variant.iconColor;
      case ZeroSnackbarAlertType.outlined:
        return variant.iconColor;
    }
  }

  /// [_getBackgroundColor] return the background color of the alert
  Color _getBackgroundColor(ZeroSnackbarAlertVariant variant, ZeroSnackbarAlertType type) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return variant.color;
      case ZeroSnackbarAlertType.filled:
        return variant.filledBackgroundColor;
      case ZeroSnackbarAlertType.outlined:
        return ZeroColors.neutral[1];
    }
  }

  /// [_titleColor] return the color of the title
  Color _titleColor(ZeroSnackbarAlertVariant variant, ZeroSnackbarAlertType type) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Colors.white;
      case ZeroSnackbarAlertType.filled:
        return variant.titleColor;
      case ZeroSnackbarAlertType.outlined:
        return variant.titleColor;
    }
  }

  /// [_subtitleColor] return the color of the subtitle
  Color _subtitleColor(ZeroSnackbarAlertVariant variant, ZeroSnackbarAlertType type) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Colors.white;
      case ZeroSnackbarAlertType.filled:
        return ZeroColors.neutral[10];
      case ZeroSnackbarAlertType.outlined:
        return ZeroColors.neutral[10];
    }
  }

  /// [hide] hide the alert by removing the [_overlayEntry] variable value
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
