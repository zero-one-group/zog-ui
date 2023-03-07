import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroTimePickerExample extends StatelessWidget {
  const ZeroTimePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZeroButton.primary(
              onPressed: () => showZeroTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ),
              child: const Text('Time Picker'),
            ),
            const SizedBox(height: 12),
            ZeroButton.primary(
              onPressed: () => showZeroTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  use24hFormat: true),
              child: const Text('Time Picker 24 Hour'),
            ),
          ],
        ),
      ),
    );
  }
}
