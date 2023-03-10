import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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
      ZeroTextfieldSize textfieldSize = ZeroTextfieldSize.multiline,
      super.suffix,
      super.inputDecorationType = InputDecorationType.outline,
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
            maxLines: maxLines ?? 10,
            minLines: minLines ?? 5,
            textAlignVertical: TextAlignVertical.top,
            keyboardType: TextInputType.multiline,
            textfieldSize: ZeroTextfieldSize.multiline,
            textInputAction: TextInputAction.newline,
            decoration: decoration?.copyWith(
              contentPadding: textfieldSize.contentPadding,
            ));

  /// This already uses [OutlineInputBorder] under the hood with the properties defined in the standard ZeroOne design guideline.
  factory ZeroTextFieldMultiline.outline({
    Key? key,
    String? hintText,
    String? labelText,
    ZeroTextfieldSize? textfielSizeType,
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
        textfieldSize: textfielSizeType ?? ZeroTextfieldSize.small,
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
    ZeroTextfieldSize? textfielSizeType,
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
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.underline,
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
    ZeroTextfieldSize? textfielSizeType,
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
        textfieldSize: textfielSizeType ?? ZeroTextfieldSize.small,
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.fill,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
      );
}
