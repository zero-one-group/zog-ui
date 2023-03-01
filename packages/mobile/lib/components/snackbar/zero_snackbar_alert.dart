import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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

    /// [style] is a style for snackbar's custom preferences.
    ///
    /// By default the style is from the global theme [ZeroThemeData.snackBarStyle.snackbar],
    /// and if [style] is not null it will be overridden
    ZeroSnackbarAlertStyle? style,

    /// [position] the position of the alert (top, bottom, center)
    SnackbarPosition position = SnackbarPosition.bottom,

    /// [action] additional widget to display on the right side of the alert
    Widget? action,
  }) {
    /// if the alert is already displayed, [_overlayEntry] cannot create a new alert
    if (_overlayEntry != null) return;
    final theme = context.theme;
    final themeStyle = theme.snackBarStyle.alert;
    final adaptiveStyle = themeStyle?.merge(style) ?? style;

    final titleColor =
        _titleColor(variant: variant, type: type, theme: theme, style: style);
    final subtitleColor =
        _subtitleColor(variant: variant, type: type, style: style);
    final titleStyle = adaptiveStyle?.titleStyle?.copyWith(
          color: style?.titleStyle?.color ?? titleColor,
        ) ??
        TextStyle(fontWeight: FontWeight.w600, color: titleColor);

    final subtitleStyle = adaptiveStyle?.subtitleStyle?.copyWith(
          color: style?.subtitleStyle?.color ?? subtitleColor,
        ) ??
        TextStyle(fontWeight: FontWeight.bold, color: subtitleColor);

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
                margin: adaptiveStyle?.margin,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: adaptiveStyle?.borderRadius,
                    border: _getBorder(
                      variant: variant,
                      type: type,
                      theme: theme,
                      style: adaptiveStyle,
                    ),
                    color: _getBackgroundColor(
                      variant: variant,
                      type: type,
                      theme: theme,
                      style: style,
                    ),
                  ),
                  padding: adaptiveStyle?.padding,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          variant.icon,
                          color: _iconColor(
                            variant: variant,
                            type: type,
                            theme: theme,
                            style: style,
                          ),
                          size: adaptiveStyle?.iconSize,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextStyle(
                              style: titleStyle,
                              child: Text(title),
                            ),
                            DefaultTextStyle(
                              style: subtitleStyle,
                              child: Text(subtitle),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: action ?? const SizedBox(),
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
    adaptiveStyle?.duration == Duration.zero
        ? null
        : Future.delayed(adaptiveStyle?.duration ?? const Duration(seconds: 2),
            () {
            hide();
          });
  }

  /// [_getBorder] return the border of the alert
  /// border only for [ZeroSnackbarAlertType.outlined]
  BoxBorder _getBorder({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    if (style?.border != null) {
      return Border.fromBorderSide(style!.border!);
    }
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Border.all(color: Colors.transparent);
      case ZeroSnackbarAlertType.filled:
        return Border.all(color: Colors.transparent);
      case ZeroSnackbarAlertType.outlined:
        return Border.all(color: variant.color(theme));
    }
  }

  /// [_iconColor] return the color of the icon
  /// icon color only for [ZeroSnackbarAlertType.outlined]
  Color _iconColor({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return Colors.white;
      case ZeroSnackbarAlertType.filled:
      case ZeroSnackbarAlertType.outlined:
        return style?.color ?? variant.iconColor(theme);
    }
  }

  /// [_getBackgroundColor] return the background color of the alert
  Color _getBackgroundColor({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        if (style?.color != null) return style!.color!;
        return variant.color(theme);
      case ZeroSnackbarAlertType.filled:
        if (style?.color != null) return style!.color!.lighten(0.5);
        return variant.filledBackgroundColor(theme);
      case ZeroSnackbarAlertType.outlined:
        return ZeroColors.neutral[1];
    }
  }

  /// [_titleColor] return the color of the title
  Color _titleColor({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    final customStyle = style?.titleStyle?.color;
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return customStyle ?? theme.cardColor;
      case ZeroSnackbarAlertType.filled:
        return customStyle ?? variant.titleColor(theme);
      case ZeroSnackbarAlertType.outlined:
        return customStyle ?? variant.titleColor(theme);
    }
  }

  /// [_subtitleColor] return the color of the subtitle
  Color _subtitleColor(
      {required ZeroSnackbarAlertVariant variant,
      required ZeroSnackbarAlertType type,
      ZeroSnackbarAlertStyle? style}) {
    final customColor = style?.subtitleStyle?.color;
    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return customColor ?? Colors.white;
      case ZeroSnackbarAlertType.filled:
        return customColor ?? ZeroColors.neutral[10];
      case ZeroSnackbarAlertType.outlined:
        return customColor ?? ZeroColors.neutral[10];
    }
  }

  /// [hide] hide the alert by removing the [_overlayEntry] variable value
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
