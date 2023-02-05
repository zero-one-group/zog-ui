import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroDatePickerExample extends StatelessWidget {
  const ZeroDatePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZeroButton.primary(
                text: 'Date Picker',
                onPressed: () async {
                  showZeroDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now().add(const Duration(days: 100)),
                  );
                }),
            ZeroButton.primary(
                text: 'Date Range Picker',
                onPressed: () async {
                  showZeroDateRangePicker(
                    context: context,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now().add(const Duration(days: 100)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
