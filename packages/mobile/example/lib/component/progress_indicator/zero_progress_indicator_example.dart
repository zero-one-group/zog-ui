import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroProgressIndicatorExample extends StatelessWidget {
  const ZeroProgressIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Progress Indicator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ZeroProgressIndicator.circular(),
            SizedBox(height: 20),
            ZeroProgressIndicator.circular(
              value: .4,
              style: ZeroProgressStyle(
                backgroundColor: ZeroColors.primary,
                valueColor: ZeroColors.polarGreen,
                lineSize: 10,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ZeroProgressIndicator.linear(),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ZeroProgressIndicator.linear(
                style: ZeroProgressStyle(
                  backgroundColor: ZeroColors.primary,
                  valueColor: ZeroColors.black,
                  lineSize: 10,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
