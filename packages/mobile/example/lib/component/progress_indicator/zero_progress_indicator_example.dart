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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZeroProgressIndicator.circular(),
            const SizedBox(height: 20),
            ZeroProgressIndicator.circular(
              value: .4,
              backgroundColor: ZeroColors.primary,
              valueColor: ZeroColors.polarGreen,
              strokeWidth: 10,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ZeroProgressIndicator.linear(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ZeroProgressIndicator.linear(
                backgroundColor: ZeroColors.primary,
                valueColor: ZeroColors.black,
                height: 10,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
