import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

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
              text: 'Time Picker',
            ),
            ZeroButton.primary(
              onPressed: () => showZeroTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  use24hFormat: true),
              text: 'Time Picker 24 Hour',
            ),
          ],
        ),
      ),
    );
  }
}
