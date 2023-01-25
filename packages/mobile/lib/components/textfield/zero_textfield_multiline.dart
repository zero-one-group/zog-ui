import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield.dart';
import 'package:zero_ui_mobile/types/textfield/input_decoration_type.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// Another variant of [ZeroTextField] which has multiline decoration enabled out of the box.
/// Pretty much all the fields are identical with [ZeroTextField]
/// except that [ZeroTextField.suffixIcon] and [ZeroTextField.prefixIcon] is not provided by default.
/// So when you want to provide these fields, you can set it manually from [InputDecoration]
class ZeroTextFieldMultiline extends ZeroTextField {
  ZeroTextFieldMultiline(
      {super.key,
      super.hintText,
      super.helperText,
      super.labelText,
      super.errorText,
      super.labelStyle,
      super.errorStyle,
      super.helperStyle,
      super.inputDecorationType = InputDecorationType.outline,
      TextfieldSizeType textfieldSizeType = TextfieldSizeType.multiline,
      super.suffix,
      InputDecoration? decoration,
      super.autovalidateMode = AutovalidateMode.onUserInteraction,
      super.enabled,
      super.onChanged,
      super.onEditingComplete,
      super.controller,
      super.focusNode,
      super.validator,
      int? maxLines,
      int? minLines})
      : super(
            maxLines: maxLines ?? 5,
            minLines: minLines ?? 3,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            textfieldSizeType: TextfieldSizeType.multiline,
            textInputAction: TextInputAction.none,
            decoration: decoration?.copyWith(
              contentPadding: textfieldSizeType.contentPadding,
            ));

  /// This already uses [OutlineInputBorder] under the hood with the properties defined in the standard ZeroOne design guideline.
  factory ZeroTextFieldMultiline.outline({
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
    Widget? suffix,
    AutovalidateMode? autovalidateMode,
    InputDecoration? decoration,
    String? helperText,
    String? errorText,
    bool? enabled,
    int? maxLines,
    int? minLines,
  }) =>
      ZeroTextFieldMultiline(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.outline,
        textfieldSizeType: textfielSizeType ?? TextfieldSizeType.small,
        autovalidateMode: autovalidateMode,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set as per defined in the standard ZeroOne design guideline.
  factory ZeroTextFieldMultiline.underline({
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
    AutovalidateMode? autovalidateMode,
    Widget? suffix,
    InputDecoration? decoration,
    String? helperText,
    String? errorText,
    bool? enabled,
    int? maxLines,
    int? minLines,
  }) =>
      ZeroTextFieldMultiline(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.underline,
        autovalidateMode: autovalidateMode,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set as per defined in the standard ZeroOne design guideline.
  factory ZeroTextFieldMultiline.fill({
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
    AutovalidateMode? autovalidateMode,
    Widget? suffix,
    InputDecoration? decoration,
    String? errorText,
    String? helperText,
    bool? enabled,
    int? maxLines,
    int? minLines,
  }) =>
      ZeroTextFieldMultiline(
        key: key,
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        validator: validator,
        inputDecorationType: InputDecorationType.fill,
        textfieldSizeType: textfielSizeType ?? TextfieldSizeType.small,
        autovalidateMode: autovalidateMode,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
      );
}