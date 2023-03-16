import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zog_ui/zog_ui.dart';

typedef OnFocusChanged = Function(bool hasFocus);
typedef BuildCounter = Widget? Function(BuildContext,
    {required int currentLength,
    required bool isFocused,
    required int? maxLength});

typedef ContextMenuBuilder = Widget Function(BuildContext, EditableTextState);

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

  final bool autocorrect;

  final Iterable<String>? autofillHints;

  final TextStyle? style;

  final String? initialValue;

  final bool expands;

  final List<TextInputFormatter>? inputFormatters;

  final TextCapitalization textCapitalization;

  final Brightness? keyboardAppearance;

  final bool obscureText;

  final bool readOnly;

  final Color? cursorColor;

  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;

  final bool enableSuggestion;

  final BuildCounter? buildCounter;

  final ContextMenuBuilder? contextMenuBuilder;

  final int? maxLength;

  final MouseCursor? mouseCursor;

  final MaxLengthEnforcement? maxLengthEnforcement;

  final String obscuringCharacter;

  final ScrollController? scrollController;

  final EdgeInsets scrollPadding;

  final ScrollPhysics? scrollPhysics;

  final StrutStyle? strutStyle;

  final bool showCursor;

  final TextAlign textAlign;

  final TextDirection? textDirection;

  final TextSelectionControls? selectionControls;

  final bool enableIMEPersonalizedLearning;

  final bool? enableInteractiveSelection;

  const ZeroTextField({
    super.key,
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
    this.onFocusChanged,
    this.autocorrect = false,
    this.autofillHints,
    this.style,
    this.initialValue,
    this.expands = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardAppearance,
    this.obscureText = false,
    this.readOnly = false,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.enableSuggestion = false,
    this.buildCounter,
    this.contextMenuBuilder,
    this.maxLength,
    this.mouseCursor,
    this.maxLengthEnforcement,
    this.obscuringCharacter = '•',
    this.scrollController,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.showCursor = true,
    this.scrollPhysics,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.selectionControls,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
  });

  /// This already uses [OutlineInputBorder] under the hood with the properties
  /// defined in the standard ZeroOne design guideline.
  factory ZeroTextField.outline({
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
    OnFocusChanged? onFocusChanged,
    bool? autocorrect,
    Iterable<String>? autofillHints,
    BuildCounter? buildCounter,
    ContextMenuBuilder? contextMenuBuilder,
    Color? cursorColor,
    double? cursorHeight,
    Radius? cursorRadius,
    double? cursorWidth,
    bool? enableIMEPersonalizedLearning,
    bool? enableInteractiveSelection,
    bool? enableSuggestion,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? labelStyle,
    int? maxLength,
    bool? expands,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Brightness? keyboardAppearance,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines,
    int? minLines,
    MouseCursor? mouseCursor,
    bool? obscureText,
    String? obscuringCharacter,
    bool? readOnly,
    ScrollController? scrollController,
    EdgeInsets? scrollPadding,
    ScrollPhysics? scrollPhysics,
    TextSelectionControls? selectionControls,
    bool? showCursor,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextCapitalization? textCapitalization,
    TextDirection? textDirection,
    TextInputAction? textInputAction,
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
        autocorrect: autocorrect ?? false,
        autofillHints: autofillHints,
        buildCounter: buildCounter,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        cursorWidth: cursorWidth ?? 2.0,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        enableInteractiveSelection: enableInteractiveSelection,
        enableSuggestion: enableSuggestion ?? false,
        errorStyle: errorStyle,
        expands: expands ?? false,
        helperStyle: helperStyle,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        keyboardAppearance: keyboardAppearance,
        labelStyle: labelStyle,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        maxLines: maxLines,
        minLines: minLines,
        mouseCursor: mouseCursor,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        readOnly: readOnly ?? false,
        scrollController: scrollController,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        showCursor: showCursor ?? true,
        strutStyle: strutStyle,
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection,
        textInputAction: textInputAction,
      );

  /// This already uses [OutlineInputBorder] under the hood with `borderRadius` set so much so that it shapes rounded.
  factory ZeroTextField.rounded({
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
    OnFocusChanged? onFocusChanged,
    bool? autocorrect,
    Iterable<String>? autofillHints,
    BuildCounter? buildCounter,
    ContextMenuBuilder? contextMenuBuilder,
    Color? cursorColor,
    double? cursorHeight,
    Radius? cursorRadius,
    double? cursorWidth,
    bool? enableIMEPersonalizedLearning,
    bool? enableInteractiveSelection,
    bool? enableSuggestion,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? labelStyle,
    int? maxLength,
    bool? expands,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Brightness? keyboardAppearance,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines,
    int? minLines,
    MouseCursor? mouseCursor,
    bool? obscureText,
    String? obscuringCharacter,
    bool? readOnly,
    ScrollController? scrollController,
    EdgeInsets? scrollPadding,
    ScrollPhysics? scrollPhysics,
    TextSelectionControls? selectionControls,
    bool? showCursor,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextCapitalization? textCapitalization,
    TextDirection? textDirection,
    TextInputAction? textInputAction,
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
        autocorrect: autocorrect ?? false,
        autofillHints: autofillHints,
        buildCounter: buildCounter,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        cursorWidth: cursorWidth ?? 2.0,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        enableInteractiveSelection: enableInteractiveSelection,
        enableSuggestion: enableSuggestion ?? false,
        errorStyle: errorStyle,
        expands: expands ?? false,
        helperStyle: helperStyle,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        keyboardAppearance: keyboardAppearance,
        labelStyle: labelStyle,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        maxLines: maxLines,
        minLines: minLines,
        mouseCursor: mouseCursor,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        readOnly: readOnly ?? false,
        scrollController: scrollController,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        showCursor: showCursor ?? true,
        strutStyle: strutStyle,
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection,
        textInputAction: textInputAction,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set
  /// as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.underline({
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
    OnFocusChanged? onFocusChanged,
    bool? autocorrect,
    Iterable<String>? autofillHints,
    BuildCounter? buildCounter,
    ContextMenuBuilder? contextMenuBuilder,
    Color? cursorColor,
    double? cursorHeight,
    Radius? cursorRadius,
    double? cursorWidth,
    bool? enableIMEPersonalizedLearning,
    bool? enableInteractiveSelection,
    bool? enableSuggestion,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? labelStyle,
    int? maxLength,
    bool? expands,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Brightness? keyboardAppearance,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines,
    int? minLines,
    MouseCursor? mouseCursor,
    bool? obscureText,
    String? obscuringCharacter,
    bool? readOnly,
    ScrollController? scrollController,
    EdgeInsets? scrollPadding,
    ScrollPhysics? scrollPhysics,
    TextSelectionControls? selectionControls,
    bool? showCursor,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextCapitalization? textCapitalization,
    TextDirection? textDirection,
    TextInputAction? textInputAction,
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
        autocorrect: autocorrect ?? false,
        autofillHints: autofillHints,
        buildCounter: buildCounter,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        cursorWidth: cursorWidth ?? 2.0,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        enableInteractiveSelection: enableInteractiveSelection,
        enableSuggestion: enableSuggestion ?? false,
        errorStyle: errorStyle,
        expands: expands ?? false,
        helperStyle: helperStyle,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        keyboardAppearance: keyboardAppearance,
        labelStyle: labelStyle,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        maxLines: maxLines,
        minLines: minLines,
        mouseCursor: mouseCursor,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        readOnly: readOnly ?? false,
        scrollController: scrollController,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        showCursor: showCursor ?? false,
        strutStyle: strutStyle,
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection,
        textInputAction: textInputAction,
      );

  /// This already uses [UnderlineInputBorder] under the hood with fillColor set
  /// as per defined in the standard ZeroOne design guideline.
  factory ZeroTextField.filled({
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
    OnFocusChanged? onFocusChanged,
    bool? autocorrect,
    Iterable<String>? autofillHints,
    BuildCounter? buildCounter,
    ContextMenuBuilder? contextMenuBuilder,
    Color? cursorColor,
    double? cursorHeight,
    Radius? cursorRadius,
    double? cursorWidth,
    bool? enableIMEPersonalizedLearning,
    bool? enableInteractiveSelection,
    bool? enableSuggestion,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? labelStyle,
    int? maxLength,
    bool? expands,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    Brightness? keyboardAppearance,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines,
    int? minLines,
    MouseCursor? mouseCursor,
    bool? obscureText,
    String? obscuringCharacter,
    bool? readOnly,
    ScrollController? scrollController,
    EdgeInsets? scrollPadding,
    ScrollPhysics? scrollPhysics,
    TextSelectionControls? selectionControls,
    bool? showCursor,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextAlignVertical? textAlignVertical,
    TextCapitalization? textCapitalization,
    TextDirection? textDirection,
    TextInputAction? textInputAction,
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
        autocorrect: autocorrect ?? false,
        autofillHints: autofillHints,
        buildCounter: buildCounter,
        contextMenuBuilder: contextMenuBuilder,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        cursorRadius: cursorRadius,
        cursorWidth: cursorWidth ?? 2.0,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning ?? true,
        enableInteractiveSelection: enableInteractiveSelection,
        enableSuggestion: enableSuggestion ?? false,
        errorStyle: errorStyle,
        expands: expands ?? false,
        helperStyle: helperStyle,
        initialValue: initialValue,
        inputFormatters: inputFormatters,
        keyboardAppearance: keyboardAppearance,
        labelStyle: labelStyle,
        maxLength: maxLength,
        maxLengthEnforcement: maxLengthEnforcement,
        maxLines: maxLines,
        minLines: minLines,
        mouseCursor: mouseCursor,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        readOnly: readOnly ?? false,
        scrollController: scrollController,
        scrollPadding: scrollPadding ?? const EdgeInsets.all(20.0),
        scrollPhysics: scrollPhysics,
        selectionControls: selectionControls,
        showCursor: showCursor ?? false,
        strutStyle: strutStyle,
        style: style,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textDirection: textDirection,
        textInputAction: textInputAction,
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
            textfieldStyleSet: context.theme.textfieldStyleSet
                .copyWith(textfieldSize: widget.textfieldSize),
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
        autocorrect: widget.autocorrect,
        autofillHints: widget.autofillHints,
        style: widget.style,
        initialValue: widget.initialValue,
        expands: widget.expands,
        inputFormatters: widget.inputFormatters,
        textCapitalization: widget.textCapitalization,
        keyboardAppearance: widget.keyboardAppearance,
        obscureText: widget.obscureText,
        readOnly: widget.readOnly,
        validator: widget.validator,
        cursorColor: widget.cursorColor,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorWidth: widget.cursorWidth,
        enableSuggestions: widget.enableSuggestion,
        contextMenuBuilder: widget.contextMenuBuilder,
        buildCounter: widget.buildCounter,
        maxLength: widget.maxLength,
        mouseCursor: widget.mouseCursor,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        obscuringCharacter: widget.obscuringCharacter,
        scrollController: widget.scrollController,
        scrollPadding: widget.scrollPadding,
        scrollPhysics: widget.scrollPhysics,
        strutStyle: widget.strutStyle,
        showCursor: widget.showCursor,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        textInputAction: widget.textInputAction,
        selectionControls: widget.selectionControls,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        enableInteractiveSelection: widget.enableInteractiveSelection,
      ),
    );
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }
}
