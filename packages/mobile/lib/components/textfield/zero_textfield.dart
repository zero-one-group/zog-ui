// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ZeroTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final bool autocorrect;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const ZeroTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.focusNode,
    this.inputType,
    this.autocorrect = false,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.suffixIcon,
  });

  factory ZeroTextField.box(
    String? hintText,
    String? labelText,
    TextEditingController controller,
    FocusNode focusNode,
    TextInputType inputType,
    bool autocorrect,
    Function(String)? onChanged,
    Function()? onEditingComplete,
  ) =>
      ZeroTextField(
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
      );

  factory ZeroTextField.underline(
    String? hintText,
    String? labelText,
    TextEditingController controller,
    FocusNode focusNode,
    TextInputType inputType,
    bool autocorrect,
    Function(String)? onChanged,
    Function()? onEditingComplete,
  ) =>
      ZeroTextField(
        labelText: labelText,
        hintText: hintText,
        controller: controller,
        focusNode: focusNode,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        labelText: labelText,
      ),
      autocorrect: autocorrect,
      keyboardType: inputType,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
    );
  }
}
