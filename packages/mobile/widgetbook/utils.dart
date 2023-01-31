import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/app.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      home: Scaffold(
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
