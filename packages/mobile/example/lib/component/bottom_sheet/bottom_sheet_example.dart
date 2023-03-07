import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroBottomSheetExample extends StatefulWidget {
  const ZeroBottomSheetExample({super.key});

  @override
  State<ZeroBottomSheetExample> createState() => _ZeroBottomSheetExampleState();
}

class _ZeroBottomSheetExampleState extends State<ZeroBottomSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Bottom Sheet Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Builder(builder: (context) {
            return ZeroButton.primary(
              child: const Text('Bottom Sheet'),
              onPressed: () {
                showZeroBottomSheet(
                  context,
                  builder: (context) => Container(
                    height: 200,
                  ),
                );
              },
            );
          }),
          const SizedBox(height: 20),
          ZeroButton.primary(
            child: const Text('Modal Bottom Sheet'),
            onPressed: () {
              showZeroModalBottomSheet(
                context,
                builder: (context) => Container(
                  height: 200,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
