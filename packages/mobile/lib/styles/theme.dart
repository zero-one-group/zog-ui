import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroTheme extends StatelessWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const ZeroTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  /// Specifies the color and typography values for descendant widgets.
  final ZeroThemeData data;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  static ZeroThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ZeroTheme>()!.data;
  }

  static ZeroThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ZeroTheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _ZeroTheme(
      data: data,
      child: IconTheme(
        data: data.iconTheme,
        child: DefaultTextStyle(
          style: data.typography.body2!,
          child: child,
        ),
      ),
    );
  }
}

class _ZeroTheme extends InheritedTheme {
  const _ZeroTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final ZeroThemeData data;

  @override
  bool updateShouldNotify(covariant _ZeroTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _ZeroTheme(data: data, child: child);
  }
}

/// Defines the default theme for a [ZeroTheme].
@immutable
class ZeroThemeData with Diagnosticable {
  final ZeroTypography typography;
  final AccentColor primaryColor;
  final String? fontFamily;

  // Base Color
  final Color disabledColor;
  final Color disabledBackgroundColor;
  final Color uncheckedColor;
  final Color checkedColor;
  final Color scaffoldBackgroundColor;
  final Color cardColor;
  final Color errorColor;
  final Color dividerColor;
  final Color solidTextColor;
  final Color regularTextColor;

  // Component Styles
  final ZeroListTileStyle listTileStyle;
  final ZeroButtonStyle primaryButtonStyle;
  final ZeroButtonStyle secondaryButtonStyle;
  final ZeroDividerStyle dividerStyle;
  final ZeroChipFilledStyle chipFilledStyle;
  final ZeroChipOutlinedStyle chipOutlinedStyle;

  final Brightness brightness;
  final IconThemeData iconTheme;
  final DialogTheme dialogTheme;

  const ZeroThemeData.raw({
    required this.typography,
    required this.primaryColor,
    this.fontFamily,

    // Base color
    required this.disabledColor,
    required this.uncheckedColor,
    required this.checkedColor,
    required this.brightness,
    required this.scaffoldBackgroundColor,
    required this.iconTheme,
    required this.dialogTheme,
    required this.cardColor,
    required this.disabledBackgroundColor,
    required this.errorColor,
    required this.dividerColor,
    required this.solidTextColor,
    required this.regularTextColor,

    // Component Style
    required this.listTileStyle,
    required this.primaryButtonStyle,
    required this.secondaryButtonStyle,
    required this.dividerStyle,
    required this.chipFilledStyle,
    required this.chipOutlinedStyle,
  });

  factory ZeroThemeData({
    Brightness? brightness,
    ZeroTypography? typography,
    String? fontFamily,
    AccentColor? primaryColor,
    Color? disabledColor,
    Color? scaffoldBackgroundColor,
    Color? uncheckedColor,
    Color? checkedColor,
    Color? cardColor,
    Color? disabledBackgroundColor,
    Color? errorColor,
    Color? dividerColor,
    Color? solidTextColor,
    Color? regularTextColor,
    IconThemeData? iconTheme,
    DialogTheme? dialogTheme,
    ZeroListTileStyle? listTileStyle,
    ZeroButtonStyle? primaryButtonStyle,
    ZeroButtonStyle? secondaryButtonStyle,
    ZeroDividerStyle? dividerStyle,
    ZeroChipFilledStyle? chipFilledStyle,
    ZeroChipOutlinedStyle? chipOutlinedStyle,
  }) {
    // TODO: Finalize the default style of theme
    brightness ??= Brightness.light;
    final isLight = brightness.isLight;

    // Base Colors
    primaryColor ??= ZeroColors.primary.toAccentColor();
    disabledColor ??= isLight ? ZeroColors.neutral[7] : ZeroColors.neutral[6];
    disabledBackgroundColor ??=
        isLight ? ZeroColors.neutral[3] : ZeroColors.neutral[8];
    scaffoldBackgroundColor ??= isLight ? ZeroColors.white : ZeroColors.black;
    uncheckedColor ??= isLight
        ? const Color.fromRGBO(0, 0, 0, 0.6063)
        : const Color.fromRGBO(255, 255, 255, 0.786);
    checkedColor ??= isLight ? ZeroColors.white : ZeroColors.black;
    cardColor ??= isLight ? ZeroColors.white : ZeroColors.neutral[9];
    errorColor ??= ZeroColors.danger;
    dividerColor ??= ZeroColors.neutral[5];
    solidTextColor ??= isLight ? ZeroColors.neutral[10] : ZeroColors.neutral[5];
    regularTextColor ??=
        isLight ? ZeroColors.neutral[7] : ZeroColors.neutral[6];

    typography ??=
        ZeroTypography.fromBrightness(color: solidTextColor).merge(typography);

    iconTheme ??= isLight
        ? const IconThemeData(color: ZeroColors.black, size: 24.0)
        : const IconThemeData(color: ZeroColors.white, size: 24.0);

    dialogTheme ??= isLight
        ? DialogTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          )
        : DialogTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );

    // Component Styles
    final listTileFallback = ZeroListTileStyle.fallback(
      dividerColor: dividerColor,
      selectedColor: primaryColor.lightest,
    );

    final primaryButtonStyleFallback = ZeroButtonStyle.primaryStyle(
      backgroundColor: primaryColor,
      foregroundColor: primaryColor.darker,
      surfaceTintColor: primaryColor.lighter,
      animatingColor: primaryColor.lighter,
      textStyle: typography.button?.copyWith(color: ZeroColors.white),
    );

    final secondaryButtonStyleFallback = ZeroButtonStyle.secondaryStyle(
      backgroundColor: cardColor,
      foregroundColor: solidTextColor,
      surfaceTintColor: primaryColor.lighter,
      animatingColor: primaryColor.lighter,
      textStyle: typography.button?.copyWith(color: solidTextColor),
    );

    final dividerStyleFallback = ZeroDividerStyle.fallback(color: dividerColor);

    final chipFilledStyleFallback = ZeroChipFilledStyle.fallback(
      textStyle: TextStyle(color: solidTextColor),
    );
    final chipOutlinedStyleFallback = ZeroChipOutlinedStyle.fallback(
      textStyle: TextStyle(color: solidTextColor),
    );

    return ZeroThemeData.raw(
      brightness: brightness,
      primaryColor: primaryColor,
      disabledColor: disabledColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      uncheckedColor: uncheckedColor,
      checkedColor: checkedColor,
      iconTheme: iconTheme,
      dialogTheme: dialogTheme,
      typography: typography,
      cardColor: cardColor,
      errorColor: errorColor,
      disabledBackgroundColor: disabledBackgroundColor,
      dividerColor: dividerColor,
      solidTextColor: solidTextColor,
      regularTextColor: regularTextColor,
      fontFamily: fontFamily,
      listTileStyle: listTileFallback.merge(listTileStyle),
      primaryButtonStyle: primaryButtonStyleFallback.merge(primaryButtonStyle),
      secondaryButtonStyle:
          secondaryButtonStyleFallback.merge(secondaryButtonStyle),
      dividerStyle: dividerStyleFallback.merge(dividerStyle),
      chipFilledStyle: chipFilledStyleFallback.merge(chipFilledStyle),
      chipOutlinedStyle: chipOutlinedStyleFallback.merge(chipOutlinedStyle),
    );
  }

  static ZeroThemeData lerp(ZeroThemeData a, ZeroThemeData b, double t) {
    return ZeroThemeData.raw(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      primaryColor: AccentColor.lerp(a.primaryColor, b.primaryColor, t),
      typography: ZeroTypography.lerp(a.typography, b.typography, t),
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t)!,
      scaffoldBackgroundColor:
          Color.lerp(a.scaffoldBackgroundColor, b.scaffoldBackgroundColor, t)!,
      uncheckedColor: Color.lerp(a.uncheckedColor, b.uncheckedColor, t)!,
      checkedColor: Color.lerp(a.checkedColor, b.checkedColor, t)!,
      cardColor: Color.lerp(a.cardColor, b.cardColor, t)!,
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      dialogTheme: DialogTheme.lerp(a.dialogTheme, b.dialogTheme, t),
      disabledBackgroundColor:
          Color.lerp(a.disabledBackgroundColor, b.disabledBackgroundColor, t)!,
      errorColor: Color.lerp(a.errorColor, b.errorColor, t)!,
      dividerColor: Color.lerp(a.dividerColor, b.dividerColor, t)!,
      solidTextColor: Color.lerp(a.solidTextColor, b.solidTextColor, t)!,
      regularTextColor: Color.lerp(a.regularTextColor, b.regularTextColor, t)!,
      listTileStyle:
          ZeroListTileStyle.lerp(a.listTileStyle, b.listTileStyle, t),
      primaryButtonStyle:
          ZeroButtonStyle.lerp(a.primaryButtonStyle, b.primaryButtonStyle, t),
      secondaryButtonStyle: ZeroButtonStyle.lerp(
          a.secondaryButtonStyle, b.secondaryButtonStyle, t),
      dividerStyle: ZeroDividerStyle.lerp(a.dividerStyle, b.dividerStyle, t),
      chipFilledStyle:
          ZeroChipFilledStyle.lerp(a.chipFilledStyle, b.chipFilledStyle, t),
      chipOutlinedStyle: ZeroChipOutlinedStyle.lerp(
          a.chipOutlinedStyle, b.chipOutlinedStyle, t),
    );
  }

  ZeroThemeData copyWith({
    Brightness? brightness,
    ZeroTypography? typography,
    String? fontFamily,
    AccentColor? primaryColor,
    Color? inactiveBackgroundColor,
    Color? disabledColor,
    Color? scaffoldBackgroundColor,
    Color? uncheckedColor,
    Color? checkedColor,
    Color? cardColor,
    Color? disabledBackgroundColor,
    Color? errorColor,
    Color? dividerColor,
    Color? solidTextColor,
    Color? regularTextColor,
    IconThemeData? iconTheme,
    DialogTheme? dialogTheme,
    ZeroListTileStyle? listTileStyle,
    ZeroButtonStyle? primaryButtonStyle,
    ZeroButtonStyle? secondaryButtonStyle,
    ZeroDividerStyle? dividerStyle,
    ZeroChipFilledStyle? chipFilledStyle,
    ZeroChipOutlinedStyle? chipOutlinedStyle,
  }) {
    return ZeroThemeData.raw(
      brightness: brightness ?? this.brightness,
      typography: typography ?? this.typography,
      fontFamily: fontFamily ?? this.fontFamily,
      primaryColor: primaryColor ?? this.primaryColor,
      uncheckedColor: uncheckedColor ?? this.uncheckedColor,
      checkedColor: checkedColor ?? this.checkedColor,
      disabledColor: disabledColor ?? this.disabledColor,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      iconTheme: this.iconTheme.merge(iconTheme),
      dialogTheme: dialogTheme ?? this.dialogTheme,
      cardColor: cardColor ?? this.cardColor,
      errorColor: errorColor ?? this.errorColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      solidTextColor: solidTextColor ?? this.solidTextColor,
      regularTextColor: regularTextColor ?? this.regularTextColor,
      listTileStyle: listTileStyle ?? this.listTileStyle,
      primaryButtonStyle: primaryButtonStyle ?? this.primaryButtonStyle,
      secondaryButtonStyle: secondaryButtonStyle ?? this.secondaryButtonStyle,
      dividerStyle: dividerStyle ?? this.dividerStyle,
      chipFilledStyle: chipFilledStyle ?? this.chipFilledStyle,
      chipOutlinedStyle: chipOutlinedStyle ?? this.chipOutlinedStyle,
    );
  }

  ThemeData toThemeData() {
    return ThemeData(
      fontFamily: fontFamily,
      primaryColor: primaryColor,
      brightness: brightness,
      disabledColor: disabledColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      useMaterial3: false,
      cardColor: cardColor,
      dividerColor: dividerColor,
      textTheme: typography.toTextTheme(),
      dialogTheme: dialogTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: primaryButtonStyle.toButtonStyle(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: secondaryButtonStyle.toButtonStyle(),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: brightness,
        cardColor: cardColor,
        errorColor: errorColor,
        backgroundColor: scaffoldBackgroundColor,
        primarySwatch: MaterialColor(
          primaryColor.value,
          {
            50: primaryColor.lightest,
            100: primaryColor.lightest,
            200: primaryColor.lighter,
            300: primaryColor.lighter,
            400: primaryColor.light,
            500: primaryColor.normal,
            600: primaryColor.dark,
            700: primaryColor.darker,
            800: primaryColor.darker,
            900: primaryColor.darkest,
          },
        ),
      ).copyWith(
        error: errorColor,
        onPrimary: Colors.white,
      ),
      dividerTheme: dividerStyle.toDividerTheme(),
      chipTheme: chipFilledStyle.toChipThemeData(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('primaryColor', primaryColor))
      ..add(ColorProperty('uncheckedColor', uncheckedColor))
      ..add(ColorProperty('checkedColor', checkedColor))
      ..add(ColorProperty('disabledColor', disabledColor))
      ..add(ColorProperty('scaffoldBackgroundColor', scaffoldBackgroundColor))
      ..add(ColorProperty('cardColor', cardColor))
      ..add(EnumProperty('brightness', brightness))
      ..add(StringProperty('fontFamily', fontFamily))
      ..add(ColorProperty('disabledBackgroundColor', disabledBackgroundColor))
      ..add(ColorProperty('errorColor', errorColor))
      ..add(ColorProperty('dividerColor', dividerColor));
  }
}
