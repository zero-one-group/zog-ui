import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroTimePicker extends StatelessWidget {
  const ZeroTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZeroButton.primary(
          onPressed: () => showZeroTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ),
          text: 'Time Picker Example',
        ),
      ),
    );
  }
}
