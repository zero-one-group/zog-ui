import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroDatePickerExample extends StatelessWidget {
  const ZeroDatePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ZeroDatePickerDocked(
              inputDecorationType: InputDecorationType.outline,
              firstDate:
                  DateTime.now().subtract(const Duration(days: 365 * 10)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
              initialDate: DateTime.now(),
              onDateChanged: (dateTime) {},
            ),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                child: const Text('Date Picker'),
                onPressed: () async {
                  showZeroDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                }),
            ZeroButton.primary(
                child: const Text('Date Range Picker'),
                onPressed: () async {
                  showZeroDateRangePicker(
                    context: context,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
