import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

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
                inputDecorationType: InputDecorationType.underline,
                firstDate:
                    DateTime.now().subtract(const Duration(days: 365 * 10)),
                lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                initialDate: DateTime.now()),
            const SizedBox(
              height: 20,
            ),
            ZeroButton.primary(
                text: 'Date Picker',
                onPressed: () async {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365 * 10)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );
                }),
            ZeroButton.primary(
                text: 'Date Range Picker',
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
            ZeroTextField.outline(
              labelText: 'Select Date',
              onFocusChanged: (bool hasFocus) {},
            ),
            ZeroDropdown(
              items: const [''],
              onChanged: (p0) {},
              menuItemBuilder: (p0) {
                return ZeroDatePickerDialog(
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365 * 10)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                );
              },
              selectedMenuItemBuilder: (p0) {
                return ZeroDatePickerDialog(
                  initialDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365 * 10)),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
