import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroProgressIndicatorExample extends StatefulWidget {
  const ZeroProgressIndicatorExample({super.key});

  @override
  State<ZeroProgressIndicatorExample> createState() => _ZeroProgressIndicatorExampleState();
}

class _ZeroProgressIndicatorExampleState extends State<ZeroProgressIndicatorExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Progress Indicator'),
      ),
      body: Center(
        child: SizedBox(
          child: ZeroProgressIndicator.circular(),
        ),
      ),
    );
  }
}
