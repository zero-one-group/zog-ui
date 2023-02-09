import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroTimePickerExample extends StatelessWidget {
  const ZeroTimePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker')),
      body: Center(
        child: ZeroButton.primary(
          onPressed: () => showZeroTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: false),
                child: child!),
          ),
          text: 'Time Picker Example',
        ),
      ),
    );
  }
}
