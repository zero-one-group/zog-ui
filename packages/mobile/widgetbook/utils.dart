import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({
    super.key,
    required this.child,
    this.theme,
  });

  final Widget child;
  final ZeroThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      theme: theme,
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
