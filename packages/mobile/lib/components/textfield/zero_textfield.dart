// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/textfield.dart/input_decoration_type.dart';

class ZeroTextField extends TextFormField {
  final String? labelText;
  final String? hintText;
  final String? errorText;

  /// Values: box, underline, and fill
  /// This affects how the widget renders [OutlineInputBorder] in terms of fill color, border colors, and fill color
  final InputDecorationType inputDecorationType;

  ZeroTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.errorText,
    this.inputDecorationType = InputDecorationType.outline,
    InputDecoration? decoration,
    AutovalidateMode? autovalidateMode,
    bool? enabled,
    super.onChanged,
    super.onEditingComplete,
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.validator,
  }) : super(
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          decoration: decoration ??
              InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: ZeroColors.neutral10, fontSize: 16),
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 12),
                  labelText: labelText,
                  floatingLabelStyle: TextStyle(
                      color: inputDecorationType
                          .floatingLabelColor(errorText != null),
                      fontSize: 11),
                  labelStyle: const TextStyle(
                      color: ZeroColors.neutral10, fontSize: 16),
                  focusColor: inputDecorationType.focusedBorderolor,
                  fillColor: inputDecorationType.fillColor(
                      error: errorText != null, enabled: enabled ?? true),
                  filled: inputDecorationType.filled,
                  focusedBorder: inputDecorationType.focusedBorder,
                  border: inputDecorationType.border,
                  errorText: errorText,
                  errorBorder: inputDecorationType.errorBorder,
                  focusedErrorBorder: inputDecorationType.errorBorder,
                  errorStyle: const TextStyle(
                    fontSize: 11,
                    color: ZeroColors.dustRed7,
                  )),
        );

  factory ZeroTextField.outline(
          {Key? key,
          String? hintText,
          String? labelText,
          TextEditingController? controller,
          FocusNode? focusNode,
          TextInputType? inputType,
          Function(String)? onChanged,
          Function()? onEditingComplete,
          String? Function(String?)? validator,
          Widget? suffixIcon,
          InputDecoration? decoration,
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
        inputDecorationType: InputDecorationType.outline,
        decoration: decoration,
        errorText: errorText,
        enabled: enabled,
      );

  factory ZeroTextField.underline(
          {Key? key,
          String? hintText,
          String? labelText,
          TextEditingController? controller,
          FocusNode? focusNode,
          TextInputType? inputType,
          Function(String)? onChanged,
          Function()? onEditingComplete,
          String? Function(String?)? validator,
          Widget? suffixIcon,
          InputDecoration? decoration,
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
        decoration: decoration,
        errorText: errorText,
        enabled: enabled,
      );

  factory ZeroTextField.fill(
          {Key? key,
          String? hintText,
          String? labelText,
          TextEditingController? controller,
          FocusNode? focusNode,
          TextInputType? inputType,
          Function(String)? onChanged,
          Function()? onEditingComplete,
          String? Function(String?)? validator,
          Widget? suffixIcon,
          InputDecoration? decoration,
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
        inputDecorationType: InputDecorationType.fill,
        decoration: decoration,
        errorText: errorText,
        enabled: enabled,
      );
}
