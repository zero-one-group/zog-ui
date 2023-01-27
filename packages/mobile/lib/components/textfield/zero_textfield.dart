import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/types/textfield/input_decoration_type.dart';
import 'package:zero_ui_mobile/types/textfield/size_type.dart';

/// [ZeroTextField] is the the simplified version of [TextField] with the default implemented design guidelines of
/// Zero One Design System. Pretty much all the fields are inheritted from [TextField]
/// except that it provides `labelText`, `hintText`, `errorText`, and `supportText` upfront instead of under [InputDecoration].
///
/// There are 4 variants represented as 4 factory constructors:
///
///   1.  [ZeroTextField.outline] which uses [OutlineInputBorder] under the hood.
///   2.  [ZeroTextField.fill] which uses [UnderlineInputBorder] under the hood with `fillColor` provided.
///   3.  [ZeroTextField.underline] which uses [UnderlineInputBorder] under the hood.
class ZeroTextField extends StatelessWidget {
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final String? errorText;

  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;

  /// If set, this will override `prefixIcon` that is defined in [InputDecoration]
  final Widget? prefixIcon;

  /// If set, this will override `suffixIcon` that is defined in [InputDecoration]
  final Widget? suffixIcon;

  /// If set, this will override `prefix` that is defined in [InputDecoration]
  final Widget? prefix;

  /// If set, this will override `suffix` that is defined in [InputDecoration]
  final Widget? suffix;

  /// Values: [InputDecorationType.outline], [InputDecorationType.underline], and [InputDecorationType.fill]
  /// This affects how the widget renders [OutlineInputBorder] in terms of fill color, border colors, and fill color
  final InputDecorationType inputDecorationType;

  /// [TextField]'s size; large or small. Default value: [TextfieldSizeType.small]
  final TextfieldSizeType textfieldSizeType;

  /// If set, this will be merged with the default [InputDecoration] defined in the default ZeroOne design system
  final InputDecoration? _decoration;

  InputDecoration? get decoration => _decoration;

  final AutovalidateMode? autovalidateMode;
  final bool? enabled;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;

  ZeroTextField(
      {super.key,
      this.hintText,
      this.helperText,
      this.labelText,
      this.errorText,
      this.labelStyle,
      this.errorStyle,
      this.helperStyle,
      this.inputDecorationType = InputDecorationType.outline,
      this.textfieldSizeType = TextfieldSizeType.small,
      this.prefixIcon,
      this.suffixIcon,
      this.prefix,
      this.suffix,
      InputDecoration? decoration,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.enabled,
      this.onChanged,
      this.onEditingComplete,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.validator,
      this.textInputAction = TextInputAction.next,
      this.minLines,
      this.maxLines,
      this.textAlignVertical})
      : _decoration = decoration ??
            InputDecoration(
              helperText: helperText,
              hintText: hintText,
              labelText: labelText,
              hintStyle: inputDecorationType
                  .textStyle(enabled ?? true)
                  .merge(labelStyle),
              helperStyle: helperStyle,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelStyle: inputDecorationType.floatingLabelStyle(
                  enabled: enabled ?? true, error: errorText != null),
              alignLabelWithHint: false,
              labelStyle: inputDecorationType
                  .textStyle(enabled ?? true)
                  .merge(labelStyle),
              isDense: textfieldSizeType.isDense,
              contentPadding: textfieldSizeType.contentPadding,
              focusColor: inputDecorationType.focusedColor,
              fillColor: inputDecorationType.fillColor(
                  enabled: enabled ?? true, error: errorText != null),
              filled: inputDecorationType.filled,
              focusedBorder:
                  inputDecorationType.focusedBorder(textfieldSizeType),
              border: inputDecorationType.border(textfieldSizeType),
              disabledBorder:
                  inputDecorationType.disabledBorder(textfieldSizeType),
              errorText: errorText,
              errorBorder: inputDecorationType.errorBorder(textfieldSizeType),
              focusedErrorBorder:
                  inputDecorationType.errorBorder(textfieldSizeType),
              errorStyle: errorStyle,
              prefixIcon: prefixIcon,
              suffixIcon: textfieldSizeType.suffixIcon(suffixIcon,
                  error: errorText != null),
            );

  /// This already uses [OutlineInputBorder] under the hood with the properties defined in the standard ZeroOne design guideline.
  factory ZeroTextField.outline({
    Key? key,
    String? hintText,
    String? labelText,
    TextfieldSizeType? textfielSizeType,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType? inputType,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    String? Function(String?)? validator,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
    String? helperText,
    String? errorText,
    bool? enabled,
  }) =>
      ZeroTextField(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        keyboardType: inputType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.outline,
        textfieldSizeType: textfielSizeType ?? TextfieldSizeType.small,
        autovalidateMode: autovalidateMode,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
      );

  /// This already uses [OutlineInputBorder] under the hood with `borderRadius` set so much so that it shapes rounded.
  factory ZeroTextField.rounded({
    Key? key,
    String? hintText,
    String? labelText,
    TextfieldSizeType? textfielSizeType,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType? inputType,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    String? Function(String?)? validator,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
    String? helperText,
    String? errorText,
    bool? enabled,
  }) =>
      ZeroTextField(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        keyboardType: inputType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.round,
        textfieldSizeType: textfielSizeType ?? TextfieldSizeType.small,
        autovalidateMode: autovalidateMode,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.underline(
          {Key? key,
          String? hintText,
          String? labelText,
          TextfieldSizeType? textfielSizeType,
          TextEditingController? controller,
          FocusNode? focusNode,
          TextInputType? inputType,
          Function(String)? onChanged,
          Function()? onEditingComplete,
          String? Function(String?)? validator,
          AutovalidateMode? autovalidateMode,
          Widget? prefixIcon,
          Widget? suffixIcon,
          Widget? prefix,
          Widget? suffix,
          InputDecoration? decoration,
          String? helperText,
          String? errorText,
          bool? enabled}) =>
      ZeroTextField(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        keyboardType: inputType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.underline,
        autovalidateMode: autovalidateMode,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.fill(
          {Key? key,
          String? hintText,
          String? labelText,
          TextfieldSizeType? textfielSizeType,
          TextEditingController? controller,
          FocusNode? focusNode,
          TextInputType? inputType,
          Function(String)? onChanged,
          Function()? onEditingComplete,
          String? Function(String?)? validator,
          AutovalidateMode? autovalidateMode,
          Widget? prefixIcon,
          Widget? suffixIcon,
          Widget? prefix,
          Widget? suffix,
          InputDecoration? decoration,
          String? errorText,
          String? helperText,
          bool? enabled}) =>
      ZeroTextField(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        keyboardType: inputType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.fill,
        textfieldSizeType: textfielSizeType ?? TextfieldSizeType.small,
        autovalidateMode: autovalidateMode,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        decoration: decoration);
  }
}
