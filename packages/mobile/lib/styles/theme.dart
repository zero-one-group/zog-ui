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
  final ZeroButtonStyle textButtonStyle;
  final ZeroDividerStyle dividerStyle;
  final ZeroChipFilledStyle chipFilledStyle;
  final ZeroChipOutlinedStyle chipOutlinedStyle;
  final ZeroNavigationBarStyle navigationBarStyle;
  final ZeroTextfieldStyleSet textfieldStyleSet;
  final ZeroTextfieldSize textfieldSize;
  final InputDecorationType inputDecorationType;
  final ZeroNavigationDrawerStyle navigationDrawerStyle;
  final ZeroAppBarStyle appBarStyle;
  final ZeroCardStyle cardStyle;
  final ZeroButtonIconStyleSet buttonIconStyle;
  final ZeroNavigationRailStyle navigationRailStyle;
  final ZeroSwitchStyleSet switchStyle;
  final ZeroTabBarStyle tabBarStyle;
  final ZeroSpeedDialStyle speedDialStyle;
  final ZeroCheckboxStyle checkboxStyle;
  final ZeroRadioStyle radioStyle;
  final ZeroProgressStyle progressStyle;
  final ZeroRatingStyle ratingStyle;
  final ZeroSliderStyle sliderStyle;
  final ZeroAvatarStyle avatarStyle;
  final ZeroMenuStyle menuStyle;
  final ZeroButtonGroupStyleSet buttonGroupStyle;

  final Brightness brightness;
  final IconThemeData iconTheme;
  final DialogTheme dialogTheme;
  final ButtonThemeData? buttonTheme;

  final ZeroExpansionTileStyle expansionTileStyle;

  final ColorScheme colorScheme;

  final bool useMaterial3;

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
    required this.expansionTileStyle,
    this.buttonTheme,
    required this.cardColor,
    required this.disabledBackgroundColor,
    required this.errorColor,
    required this.dividerColor,
    required this.solidTextColor,
    required this.regularTextColor,
    required this.colorScheme,

    // Component Style
    required this.listTileStyle,
    required this.primaryButtonStyle,
    required this.secondaryButtonStyle,
    required this.textButtonStyle,
    required this.dividerStyle,
    required this.chipFilledStyle,
    required this.chipOutlinedStyle,
    required this.navigationBarStyle,
    required this.textfieldStyleSet,
    required this.inputDecorationType,
    required this.textfieldSize,
    required this.navigationDrawerStyle,
    required this.appBarStyle,
    required this.cardStyle,
    required this.buttonIconStyle,
    required this.navigationRailStyle,
    required this.switchStyle,
    required this.tabBarStyle,
    required this.speedDialStyle,
    required this.checkboxStyle,
    required this.radioStyle,
    required this.progressStyle,
    required this.ratingStyle,
    required this.sliderStyle,
    required this.avatarStyle,
    required this.menuStyle,
    required this.buttonGroupStyle,

    // Others
    this.useMaterial3 = false,
  });

  factory ZeroThemeData({
    Brightness? brightness,
    ZeroTypography? typography,
    String? fontFamily,
    bool? useMaterial3,
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
    ColorScheme? colorScheme,
    IconThemeData? iconTheme,
    DialogTheme? dialogTheme,
    ButtonThemeData? buttonTheme,
    InputDecorationTheme? inputDecorationTheme,
    ZeroListTileStyle? listTileStyle,
    ZeroButtonStyle? primaryButtonStyle,
    ZeroButtonStyle? secondaryButtonStyle,
    ZeroButtonStyle? textButtonStyle,
    ZeroDividerStyle? dividerStyle,
    ZeroChipFilledStyle? chipFilledStyle,
    ZeroChipOutlinedStyle? chipOutlinedStyle,
    ZeroNavigationBarStyle? navigationBarStyle,
    ZeroTextfieldStyleSet? textfieldStyleSet,
    InputDecorationType? inputDecorationType,
    ZeroTextfieldSize? textfieldSize,
    ZeroNavigationDrawerStyle? navigationDrawerStyle,
    ZeroAppBarStyle? appBarStyle,
    ZeroCardStyle? cardStyle,
    ZeroButtonIconStyleSet? buttonIconStyle,
    ZeroNavigationRailStyle? navigationRailStyle,
    ZeroSwitchStyleSet? switchStyle,
    ZeroTabBarStyle? tabBarStyle,
    ZeroSpeedDialStyle? speedDialStyle,
    ZeroCheckboxStyle? checkboxStyle,
    ZeroRadioStyle? radioStyle,
    ZeroProgressStyle? progressStyle,
    ZeroRatingStyle? ratingStyle,
    ZeroSliderStyle? sliderStyle,
    ZeroAvatarStyle? avatarStyle,
    ZeroExpansionTileStyle? expansionTileStyle,
    ZeroButtonGroupStyleSet? buttonGroupStyle,
    ZeroMenuStyle? menuStyle,
    ZeroButtonGroupStyleSet? buttonGroupStyle,
  }) {
    // TODO: Finalize the default style of theme
    brightness ??= Brightness.light;
    final isLight = brightness.isLight;

    // Base Colors
    primaryColor ??= ZeroColors.primary.toAccentColor();
    disabledColor ??= isLight ? ZeroColors.neutral[7] : ZeroColors.neutral[6];
    disabledBackgroundColor ??=
        isLight ? ZeroColors.neutral[3] : ZeroColors.neutral[8];
    scaffoldBackgroundColor ??=
        isLight ? ZeroColors.neutral[2] : ZeroColors.neutral[11];
    uncheckedColor ??= isLight ? ZeroColors.neutral[7] : ZeroColors.neutral[9];
    checkedColor ??= primaryColor;
    cardColor ??= isLight ? ZeroColors.white : ZeroColors.neutral[9];
    errorColor ??= ZeroColors.danger;
    dividerColor ??= isLight ? ZeroColors.neutral[5] : ZeroColors.neutral[10];
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
            backgroundColor: ZeroColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            titleTextStyle: typography.heading6,
            contentTextStyle: typography.body2,
          )
        : DialogTheme(
            backgroundColor: ZeroColors.neutral[10],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            titleTextStyle: typography.heading6,
            contentTextStyle: typography.body2,
          );

    buttonTheme ??= const ButtonThemeData(
      alignedDropdown: true,
    );

    final expansionTileStyleFallback = ZeroExpansionTileStyle.fallback(
        backgroundColor: scaffoldBackgroundColor,
        collapsedBackgroundColor: scaffoldBackgroundColor,
        childrenBackgroundColor: scaffoldBackgroundColor,
        iconColor: typography.subtitle1?.color ?? ZeroColors.neutral[10],
        collapsedIconColor:
            typography.subtitle1?.color ?? ZeroColors.neutral[10],
        titleColor: ZeroColors.neutral[5],
        collapsedTitleColor: ZeroColors.neutral[3],
        textColor: typography.subtitle1?.color ?? ZeroColors.neutral[10],
        collapsedTextColor:
            typography.subtitle1?.color ?? ZeroColors.neutral[10]);

    textfieldSize ??= ZeroTextfieldSize.small;
    inputDecorationType ??= InputDecorationType.underline;

    textfieldStyleSet ??= ZeroTextfieldStyleSet(
        outline: ZeroTextfieldStyle.outline(
            textfieldSize: textfieldSize,
            focusedBorderColor: primaryColor,
            focusedColor: primaryColor),
        rounded: ZeroTextfieldStyle.rounded(
            textfieldSize: textfieldSize,
            focusedBorderColor: primaryColor,
            focusedColor: primaryColor),
        filled: ZeroTextfieldStyle.fill(
            textfieldSize: textfieldSize,
            focusedBorderColor: primaryColor,
            focusedColor: primaryColor,
            fillColor: primaryColor.lightest),
        underline: ZeroTextfieldStyle.underline(
            textfieldSize: textfieldSize,
            focusedBorderColor: primaryColor,
            focusedColor: primaryColor),
        inputDecorationType: inputDecorationType);

    colorScheme ??= ColorScheme.fromSwatch(
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

    final textButtonStyleFallback = secondaryButtonStyleFallback.copyWith(
        elevation: 0, side: BorderSide.none);

    final dividerStyleFallback = ZeroDividerStyle.fallback(color: dividerColor);

    final chipFilledStyleFallback = ZeroChipFilledStyle.fallback(
      textStyle: TextStyle(color: solidTextColor),
    );
    final chipOutlinedStyleFallback = ZeroChipOutlinedStyle.fallback(
      textStyle: TextStyle(color: solidTextColor),
    );
    final navigationBarStyleFallback = ZeroNavigationBarStyle.fallback(
      backgroundColor: isLight ? ZeroColors.white : ZeroColors.black,
      indicatorColor: primaryColor.lighter,
      selectedColor: isLight ? ZeroColors.black : ZeroColors.white,
      unselectedColor: isLight ? ZeroColors.black : ZeroColors.white,
    );
    final navigationDrawerStyleFallback = ZeroNavigationDrawerStyle.fallback(
      backgroundColor: isLight ? ZeroColors.white : ZeroColors.black,
      headerTitleStyle: typography.subtitle1,
      sectionTitleStyle: typography.subtitle2,
    );
    final cardStyle = ZeroCardStyle.fallback(
      backgroundColor: cardColor,
      side: BorderSide(color: dividerColor, width: 1),
    );

    final appBarStyleFallback = ZeroAppBarStyle.fallback(
      backgroundColor: isLight ? ZeroColors.white : ZeroColors.black,
      foregroundColor: isLight ? ZeroColors.neutral[10] : ZeroColors.neutral[4],
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      titleStyle: typography.heading5,
    );

    final buttonIconStyleFallback = ZeroButtonIconStyleSet.fallback(
      primaryColor: primaryColor,
      disabledColor: disabledColor,
    );

    final navigationRailStyleFallback = ZeroNavigationRailStyle.fallback(
      backgrondColor: isLight ? ZeroColors.white : ZeroColors.black,
      activeColor: isLight ? ZeroColors.white : ZeroColors.black,
      indicatorColor: primaryColor,
      labelStyle: typography.caption,
    );

    final switchStyleFallback = ZeroSwitchStyleSet.fallback(
      primaryColor: primaryColor,
      inActiveColor: disabledColor,
      inActiveIOSColor: dividerColor,
      disabledColor: dividerColor,
    );

    final tabBarStyleFallback = ZeroTabBarStyle.fallback(
      activeColor: primaryColor,
      indicatorColor: primaryColor,
      inactiveColor: regularTextColor,
    );

    final speedDialStyleFallback = ZeroSpeedDialStyle.fallback(
      activeColor: isLight ? ZeroColors.white : ZeroColors.black,
      inactiveColor: isLight ? ZeroColors.white : ZeroColors.black,
    );

    final checkboxStyleFallback = ZeroCheckboxStyle.fallback(
      activeColor: checkedColor,
      checkColor: colorScheme.onPrimary,
      inactiveColor: uncheckedColor,
      disabledColor: disabledColor,
    );

    final radioStyleFallback = ZeroRadioStyle.fallback(
      activeColor: checkedColor,
      inactiveColor: uncheckedColor,
      disabledColor: disabledColor,
    );

    final progeressStyleFallback = ZeroProgressStyle.fallback(
      backgroundColor: isLight ? ZeroColors.neutral[4] : ZeroColors.neutral[10],
      lineSize: 4,
      valueColor: primaryColor,
    );

    final ratingStyleFallback = ZeroRatingStyle.fallback(
      inactiveColor: isLight ? ZeroColors.neutral : ZeroColors.neutral[10],
      spacing: 2,
    );

    final sliderStyleFallback = ZeroSliderStyle.fallback(
      primaryColor: primaryColor,
      thickColor: primaryColor,
    );

    final avatarStyleFallback =
        ZeroAvatarStyle.fallback(backgroundColor: primaryColor);

    final menuStyleFallback = ZeroMenuStyle.fallback();
    final buttonGroupStyleFallback =
        ZeroButtonGroupStyleSet.fallback(primaryColor: primaryColor);
    useMaterial3 ??= false;

    return ZeroThemeData.raw(
        brightness: brightness,
        useMaterial3: useMaterial3,
        primaryColor: primaryColor,
        disabledColor: disabledColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        uncheckedColor: uncheckedColor,
        checkedColor: checkedColor,
        iconTheme: iconTheme,
        dialogTheme: dialogTheme,
        buttonTheme: buttonTheme,
        expansionTileStyle:
            expansionTileStyleFallback.merge(expansionTileStyle),
        colorScheme: colorScheme,
        typography: typography,
        cardColor: cardColor,
        errorColor: errorColor,
        disabledBackgroundColor: disabledBackgroundColor,
        dividerColor: dividerColor,
        solidTextColor: solidTextColor,
        regularTextColor: regularTextColor,
        fontFamily: fontFamily,
        listTileStyle: listTileFallback.merge(listTileStyle),
        primaryButtonStyle:
            primaryButtonStyleFallback.merge(primaryButtonStyle),
        secondaryButtonStyle:
            secondaryButtonStyleFallback.merge(secondaryButtonStyle),
        textButtonStyle: textButtonStyleFallback.merge(textButtonStyle),
        dividerStyle: dividerStyleFallback.merge(dividerStyle),
        chipFilledStyle: chipFilledStyleFallback.merge(chipFilledStyle),
        chipOutlinedStyle: chipOutlinedStyleFallback.merge(chipOutlinedStyle),
        navigationBarStyle:
            navigationBarStyleFallback.merge(navigationBarStyle),
        textfieldStyleSet: textfieldStyleSet,
        inputDecorationType: inputDecorationType,
        textfieldSize: textfieldSize,
        navigationDrawerStyle:
            navigationDrawerStyleFallback.merge(navigationDrawerStyle),
        appBarStyle: appBarStyleFallback.merge(appBarStyleFallback),
        cardStyle: cardStyle.merge(cardStyle),
        buttonIconStyle: buttonIconStyleFallback.merge(buttonIconStyle),
        navigationRailStyle:
            navigationRailStyleFallback.merge(navigationRailStyle),
        switchStyle: switchStyleFallback.merge(switchStyle),
        tabBarStyle: tabBarStyleFallback.merge(tabBarStyle),
        speedDialStyle: speedDialStyleFallback.merge(speedDialStyle),
        checkboxStyle: checkboxStyleFallback.merge(checkboxStyle),
        radioStyle: radioStyleFallback.merge(radioStyle),
        progressStyle: progeressStyleFallback.merge(progressStyle),
        ratingStyle: ratingStyleFallback.merge(ratingStyle),
        sliderStyle: sliderStyleFallback.merge(sliderStyle),
        avatarStyle: avatarStyleFallback.merge(avatarStyle),
        buttonGroupStyle: buttonGroupStyleFallback.merge(buttonGroupStyle),
        menuStyle: menuStyleFallback.merge(menuStyle));
  }

  static ZeroThemeData lerp(ZeroThemeData a, ZeroThemeData b, double t) {
    return ZeroThemeData.raw(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      fontFamily: t < 0.5 ? a.fontFamily : b.fontFamily,
      useMaterial3: t < 0.5 ? a.useMaterial3 : b.useMaterial3,
      primaryColor: AccentColor.lerp(a.primaryColor, b.primaryColor, t),
      typography: ZeroTypography.lerp(a.typography, b.typography, t),
      disabledColor: Color.lerp(a.disabledColor, b.disabledColor, t)!,
      scaffoldBackgroundColor:
          Color.lerp(a.scaffoldBackgroundColor, b.scaffoldBackgroundColor, t)!,
      uncheckedColor: Color.lerp(a.uncheckedColor, b.uncheckedColor, t)!,
      checkedColor: Color.lerp(a.checkedColor, b.checkedColor, t)!,
      cardColor: Color.lerp(a.cardColor, b.cardColor, t)!,
      colorScheme: ColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      iconTheme: IconThemeData.lerp(a.iconTheme, b.iconTheme, t),
      dialogTheme: DialogTheme.lerp(a.dialogTheme, b.dialogTheme, t),
      expansionTileStyle: ZeroExpansionTileStyle.lerp(
          a.expansionTileStyle, b.expansionTileStyle, t)!,
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
      textButtonStyle:
          ZeroButtonStyle.lerp(a.textButtonStyle, b.textButtonStyle, t),
      dividerStyle: ZeroDividerStyle.lerp(a.dividerStyle, b.dividerStyle, t),
      chipFilledStyle:
          ZeroChipFilledStyle.lerp(a.chipFilledStyle, b.chipFilledStyle, t),
      chipOutlinedStyle: ZeroChipOutlinedStyle.lerp(
          a.chipOutlinedStyle, b.chipOutlinedStyle, t),
      navigationBarStyle: ZeroNavigationBarStyle.lerp(
          a.navigationBarStyle, b.navigationBarStyle, t),
      navigationDrawerStyle: ZeroNavigationDrawerStyle.lerp(
          a.navigationDrawerStyle, b.navigationDrawerStyle, t),
      appBarStyle: ZeroAppBarStyle.lerp(a.appBarStyle, b.appBarStyle, t),
      cardStyle: ZeroCardStyle.lerp(a.cardStyle, b.cardStyle, t),
      buttonIconStyle:
          ZeroButtonIconStyleSet.lerp(a.buttonIconStyle, b.buttonIconStyle, t),
      navigationRailStyle: ZeroNavigationRailStyle.lerp(
          a.navigationRailStyle, b.navigationRailStyle, t),
      switchStyle: ZeroSwitchStyleSet.lerp(a.switchStyle, b.switchStyle, t),
      tabBarStyle: ZeroTabBarStyle.lerp(a.tabBarStyle, b.tabBarStyle, t),
      menuStyle: ZeroMenuStyle.lerp(a.menuStyle, b.menuStyle, t)!,
      inputDecorationType:
          t < 0.5 ? a.inputDecorationType : b.inputDecorationType,
      textfieldSize: t < 0.5 ? a.textfieldSize : b.textfieldSize,
      speedDialStyle:
          ZeroSpeedDialStyle.lerp(a.speedDialStyle, b.speedDialStyle, t),
      textfieldStyleSet: ZeroTextfieldStyleSet.lerp(
          a.textfieldStyleSet, b.textfieldStyleSet, t),
      checkboxStyle:
          ZeroCheckboxStyle.lerp(a.checkboxStyle, b.checkboxStyle, t),
      radioStyle: ZeroRadioStyle.lerp(a.radioStyle, b.radioStyle, t),
      progressStyle:
          ZeroProgressStyle.lerp(a.progressStyle, b.progressStyle, t),
      ratingStyle: ZeroRatingStyle.lerp(a.ratingStyle, b.ratingStyle, t),
      sliderStyle: ZeroSliderStyle.lerp(a.sliderStyle, b.sliderStyle, t),
      avatarStyle: ZeroAvatarStyle.lerp(a.avatarStyle, b.avatarStyle, t),
      buttonTheme: t < 0.5 ? a.buttonTheme : b.buttonTheme,
      buttonGroupStyle: ZeroButtonGroupStyleSet.lerp(
          a.buttonGroupStyle, b.buttonGroupStyle, t),
    );
  }

  ZeroThemeData copyWith({
    Brightness? brightness,
    ZeroTypography? typography,
    bool? useMaterial3,
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
    ColorScheme? colorScheme,
    IconThemeData? iconTheme,
    DialogTheme? dialogTheme,
    ButtonThemeData? buttonTheme,
    InputDecorationTheme? inputDecorationTheme,
    ZeroListTileStyle? listTileStyle,
    ZeroButtonStyle? primaryButtonStyle,
    ZeroButtonStyle? secondaryButtonStyle,
    ZeroButtonStyle? textButtonStyle,
    ZeroDividerStyle? dividerStyle,
    ZeroChipFilledStyle? chipFilledStyle,
    ZeroChipOutlinedStyle? chipOutlinedStyle,
    ZeroNavigationBarStyle? navigationBarStyle,
    ZeroTextfieldStyleSet? textfieldStyleSet,
    InputDecorationType? inputDecorationType,
    ZeroTextfieldSize? textfieldSize,
    ZeroNavigationDrawerStyle? navigationDrawerStyle,
    ZeroAppBarStyle? appBarStyle,
    ZeroCardStyle? cardStyle,
    ZeroButtonIconStyleSet? buttonIconStyle,
    ZeroNavigationRailStyle? navigationRailStyle,
    ZeroSwitchStyleSet? switchStyle,
    ZeroTabBarStyle? tabBarStyle,
    ZeroSpeedDialStyle? speedDialStyle,
    ZeroCheckboxStyle? checkboxStyle,
    ZeroRadioStyle? radioStyle,
    ZeroProgressStyle? progressStyle,
    ZeroRatingStyle? ratingStyle,
    ZeroSliderStyle? sliderStyle,
    ZeroAvatarStyle? avatarStyle,
    ZeroMenuStyle? menuStyle,
    ZeroButtonGroupStyleSet? buttonGroupStyle,
    ZeroMenuStyle? menuStyle,
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
      colorScheme: colorScheme ?? this.colorScheme,
      iconTheme: this.iconTheme.merge(iconTheme),
      buttonTheme: buttonTheme ?? this.buttonTheme,
      dialogTheme: dialogTheme ?? this.dialogTheme,
      expansionTileStyle: expansionTileStyle,
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
      textButtonStyle: textButtonStyle ?? this.textButtonStyle,
      dividerStyle: dividerStyle ?? this.dividerStyle,
      chipFilledStyle: chipFilledStyle ?? this.chipFilledStyle,
      chipOutlinedStyle: chipOutlinedStyle ?? this.chipOutlinedStyle,
      navigationBarStyle: navigationBarStyle ?? this.navigationBarStyle,
      menuStyle: menuStyle ?? this.menuStyle,
      inputDecorationType: inputDecorationType ?? this.inputDecorationType,
      textfieldStyleSet: this.textfieldStyleSet.copyWith(
          inputDecorationType: inputDecorationType,
          outline: this
              .textfieldStyleSet
              .outline
              .copyWith(textfieldSize: textfieldSize),
          rounded: this.textfieldStyleSet.rounded.copyWith(
                textfieldSize: textfieldSize,
              ),
          filled: this.textfieldStyleSet.filled.copyWith(
                textfieldSize: textfieldSize,
              ),
          underline: this.textfieldStyleSet.underline.copyWith(
                textfieldSize: textfieldSize,
              )),
      textfieldSize: textfieldSize ?? this.textfieldSize,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      navigationDrawerStyle:
          navigationDrawerStyle ?? this.navigationDrawerStyle,
      appBarStyle: appBarStyle ?? this.appBarStyle,
      cardStyle: cardStyle ?? this.cardStyle,
      buttonIconStyle: buttonIconStyle ?? this.buttonIconStyle,
      navigationRailStyle: navigationRailStyle ?? this.navigationRailStyle,
      switchStyle: switchStyle ?? this.switchStyle,
      tabBarStyle: tabBarStyle ?? this.tabBarStyle,
      speedDialStyle: speedDialStyle ?? this.speedDialStyle,
      checkboxStyle: checkboxStyle ?? this.checkboxStyle,
      radioStyle: radioStyle ?? this.radioStyle,
      progressStyle: progressStyle ?? this.progressStyle,
      ratingStyle: ratingStyle ?? this.ratingStyle,
      sliderStyle: sliderStyle ?? this.sliderStyle,
      avatarStyle: avatarStyle ?? this.avatarStyle,
      buttonGroupStyle: buttonGroupStyle ?? this.buttonGroupStyle,
    );
  }

  ThemeData toThemeData() {
    return ThemeData(
      fontFamily: fontFamily,
      primaryColor: primaryColor,
      brightness: brightness,
      disabledColor: disabledColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      useMaterial3: useMaterial3,
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
      buttonTheme: buttonTheme,
      inputDecorationTheme:
          textfieldStyleSet.mainStyle.toInputDecorationTheme(),
      colorScheme: colorScheme,
      dividerTheme: dividerStyle.toDividerTheme(),
      chipTheme: chipFilledStyle.toChipThemeData(),
      navigationBarTheme: navigationBarStyle.toNavigationBarTheme(),
      drawerTheme: navigationDrawerStyle.toNavigationDrawerTheme(),
      appBarTheme: appBarStyle.toAppBarTheme(),
      navigationRailTheme: navigationRailStyle.toNavigationRailTheme(),
      tabBarTheme: tabBarStyle.toTabBarTheme(),
      checkboxTheme: checkboxStyle.toCheckBoxTheme(),
      radioTheme: radioStyle.toRadioTheme(),
      sliderTheme: sliderStyle.toSliderTheme(),
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
