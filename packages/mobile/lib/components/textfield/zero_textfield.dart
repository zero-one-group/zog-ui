import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

typedef OnFocusChanged = Function(bool hasFocus);

/// [ZeroTextField] is the the simplified version of [TextField] with the default implemented design guidelines of
/// Zero One Design System. Pretty much all the fields are inheritted from [TextField]
/// except that it provides `labelText`, `hintText`, `errorText`, and `supportText` upfront instead of under [InputDecoration].
///
/// There are 4 variants represented as 4 factory constructors:
///
///   1.  [ZeroTextField.outline] which uses [OutlineInputBorder] under the hood.
///   2.  [ZeroTextField.filled] which uses [UnderlineInputBorder] under the hood with `fillColor` provided.
///   3.  [ZeroTextField.underline] which uses [UnderlineInputBorder] under the hood.
class ZeroTextField extends StatefulWidget {
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

  /// Values: [inputDecorationType.outline], [inputDecorationType.underline], and [inputDecorationType.fill]
  /// This affects how the widget renders [OutlineInputBorder] in terms of fill color, border colors, and fill color
  final InputDecorationType? inputDecorationType;

  /// [TextField]'s size; large or small. Default value: [ZeroTextfieldSize.small]
  final ZeroTextfieldSize textfieldSize;

  final void Function(String text)? onFieldSubmitted;

  final void Function(String? text)? onSaved;

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
  final bool? autofocus;
  final InputDecoration? decoration;

  final Function()? onTap;
  final Function(PointerDownEvent event)? onTapOutside;
  final OnFocusChanged? onFocusChanged;

  const ZeroTextField(
      {super.key,
      this.hintText,
      this.helperText,
      this.labelText,
      this.errorText,
      this.labelStyle,
      this.errorStyle,
      this.helperStyle,
      this.inputDecorationType,
      this.textfieldSize = ZeroTextfieldSize.small,
      this.prefixIcon,
      this.suffixIcon,
      this.prefix,
      this.suffix,
      this.decoration,
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
      this.textAlignVertical,
      this.autofocus = false,
      this.onFieldSubmitted,
      this.onSaved,
      this.onTap,
      this.onTapOutside,
      this.onFocusChanged});

  /// This already uses [OutlineInputBorder] under the hood with the properties
  /// defined in the standard ZeroOne design guideline.
  factory ZeroTextField.outline(
          {Key? key,
          String? hintText,
          String? labelText,
          ZeroTextfieldSize? textfielSizeType,
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
          bool? autofocus,
          void Function(String text)? onFieldSubmitted,
          void Function(String? text)? onSaved,
          void Function()? onTap,
          void Function(PointerDownEvent event)? onTapOutside,
          OnFocusChanged? onFocusChanged}) =>
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
        textfieldSize: textfielSizeType ?? ZeroTextfieldSize.small,
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.outline,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        autofocus: autofocus,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onFocusChanged: onFocusChanged,
      );

  /// This already uses [OutlineInputBorder] under the hood with `borderRadius` set so much so that it shapes rounded.
  factory ZeroTextField.rounded(
          {Key? key,
          String? hintText,
          String? labelText,
          ZeroTextfieldSize? textfielSizeType,
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
          bool? autofocus,
          void Function(String text)? onFieldSubmitted,
          void Function(String? text)? onSaved,
          void Function()? onTap,
          void Function(PointerDownEvent event)? onTapOutside,
          OnFocusChanged? onFocusChanged}) =>
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
        textfieldSize: textfielSizeType ?? ZeroTextfieldSize.small,
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.rounded,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        autofocus: autofocus,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onFocusChanged: onFocusChanged,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set
  /// as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.underline(
          {Key? key,
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
          Widget? prefixIcon,
          Widget? suffixIcon,
          Widget? prefix,
          Widget? suffix,
          InputDecoration? decoration,
          String? helperText,
          String? errorText,
          bool? enabled,
          bool? autofocus,
          void Function(String text)? onFieldSubmitted,
          void Function(String? text)? onSaved,
          void Function()? onTap,
          void Function(PointerDownEvent event)? onTapOutside,
          OnFocusChanged? onFocusChanged}) =>
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
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.underline,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        autofocus: autofocus,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onFocusChanged: onFocusChanged,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set
  /// as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.filled(
          {Key? key,
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
          Widget? prefixIcon,
          Widget? suffixIcon,
          Widget? prefix,
          Widget? suffix,
          InputDecoration? decoration,
          String? errorText,
          String? helperText,
          bool? enabled,
          bool? autofocus,
          void Function(String text)? onFieldSubmitted,
          void Function(String? text)? onSaved,
          void Function()? onTap,
          void Function(PointerDownEvent event)? onTapOutside,
          OnFocusChanged? onFocusChanged}) =>
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
        textfieldSize: textfielSizeType ?? ZeroTextfieldSize.small,
        autovalidateMode: autovalidateMode,
        inputDecorationType: InputDecorationType.fill,
        decoration: decoration,
        helperText: helperText,
        errorText: errorText,
        enabled: enabled,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        autofocus: autofocus,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        onTapOutside: onTapOutside,
        onFocusChanged: onFocusChanged,
      );

  @override
  State<ZeroTextField> createState() => _ZeroTextFieldState();
}

class _ZeroTextFieldState extends State<ZeroTextField> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode
        .addListener(() => widget.onFocusChanged?.call(_focusNode.hasFocus));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme
          .copyWith(
            inputDecorationType: widget.inputDecorationType,
            textfieldSize: widget.textfieldSize,
          )
          .toThemeData(),
      child: TextFormField(
        key: widget.key,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: widget.enabled,
        textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
        decoration: widget.decoration ??
            InputDecoration(
              helperText: widget.helperText,
              hintText: widget.hintText,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              errorText: widget.errorText,
              floatingLabelStyle: widget.errorStyle,
              suffixIcon: widget.textfieldSize.suffixIcon(widget.suffixIcon,
                  error: widget.errorText != null),
            ),
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        autofocus: widget.autofocus ?? false,
        focusNode: _focusNode,
        onSaved: widget.onSaved,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
      ),
    );
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }
}
