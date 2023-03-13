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
    String? subtitle,

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

    final titleColor = _getTitleColor(
      variant: variant,
      type: type,
      theme: theme,
      style: style,
    );

    final subtitleColor = _getSubtitleColor(
      variant: variant,
      type: type,
      style: style,
      theme: theme,
    );

    final titleStyle = adaptiveStyle?.titleStyle?.copyWith(
          color: style?.titleStyle?.color ?? titleColor,
        ) ??
        TextStyle(fontWeight: FontWeight.w600, color: titleColor);

    final subtitleStyle = adaptiveStyle?.subtitleStyle?.copyWith(
          color: style?.subtitleStyle?.color ?? subtitleColor,
        ) ??
        TextStyle(fontWeight: FontWeight.bold, color: subtitleColor);
    final hasSubtitle = subtitle != null && subtitle.isNotEmpty;

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
                    crossAxisAlignment: hasSubtitle
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          variant.icon,
                          color: _getIconColor(
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
                            if (hasSubtitle)
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
    if (adaptiveStyle?.duration != Duration.zero) {
      Future.delayed(adaptiveStyle?.duration ?? const Duration(seconds: 2), () {
        hide();
      });
    }
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
        return Border.all(color: variant.color(theme, style));
    }
  }

  /// [_getIconColor] return the color of the icon
  /// icon color only for [ZeroSnackbarAlertType.outlined]
  Color _getIconColor({
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
        return style?.color ?? variant.iconColor(theme, style);
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
        return variant.color(theme, style);
      case ZeroSnackbarAlertType.filled:
        if (style?.color != null) return style!.color!.lighten(0.5);
        return variant.filledBackgroundColor(theme, style);
      case ZeroSnackbarAlertType.outlined:
        if (style?.color != null) return style!.color!;
        return theme.cardColor;
    }
  }

  /// [_getTitleColor] return the color of the title
  Color _getTitleColor({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    final customStyle = style?.titleStyle?.color;

    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return customStyle ?? Colors.white;
      case ZeroSnackbarAlertType.filled:
        return customStyle ?? variant.titleColor(theme, style);
      case ZeroSnackbarAlertType.outlined:
        return customStyle ?? variant.titleColor(theme, style);
    }
  }

  /// [_getSubtitleColor] return the color of the subtitle
  Color _getSubtitleColor({
    required ZeroSnackbarAlertVariant variant,
    required ZeroSnackbarAlertType type,
    required ZeroThemeData theme,
    ZeroSnackbarAlertStyle? style,
  }) {
    final customColor = style?.subtitleStyle?.color;
    final defaultColor = customColor ?? variant.titleColor(theme, style);

    switch (type) {
      case ZeroSnackbarAlertType.solidFilled:
        return customColor ?? Colors.white;
      case ZeroSnackbarAlertType.filled:
        return defaultColor;
      case ZeroSnackbarAlertType.outlined:
        return defaultColor;
    }
  }

  /// [hide] hide the alert by removing the [_overlayEntry] variable value
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
