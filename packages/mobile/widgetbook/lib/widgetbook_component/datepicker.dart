import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent datepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Date Picker',
  useCases: [
    WidgetbookUseCase(
        name: 'Date Picker',
        builder: (context) => PreviewWidget.builder(
              theme: ZeroThemeData(),
              builder: (context) => ZeroButton.primary(
                  child: const Text('Date Picker'),
                  onPressed: () async {
                    showZeroDatePicker(
                      context: context,
                      useRootNavigator: false,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 100)),
                      style: ZeroDatePickerStyle(
                          pickerBackgroundColor: Colors.red,
                          headerBackgroundColor: Colors.yellow,
                          dateTextStyle: TextStyle(fontSize: 30),
                          insetPadding: EdgeInsets.all(30),
                          entryModeIconColor: Colors.amber,
                          shape: Border.all(color: Colors.white, width: 2)),
                    );
                  }),
            )),
    WidgetbookUseCase(
        name: 'Date Range Picker',
        builder: (context) => PreviewWidget.builder(
              theme: ZeroThemeData(),
              builder: (context) => ZeroButton.primary(
                  child: const Text('Date Range Picker'),
                  onPressed: () async {
                    showZeroDateRangePicker(
                      context: context,
                      useRootNavigator: false,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 100)),
                    );
                  }),
            )),
    WidgetbookUseCase(
        name: 'Date Range Docked',
        builder: (context) => PreviewWidget(
              theme: ZeroThemeData(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ZeroDatePickerDocked(
                      inputDecorationType: InputDecorationType.outline,
                      firstDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 10)),
                      lastDate:
                          DateTime.now().add(const Duration(days: 365 * 10)),
                      initialDate: DateTime.now(),
                      onDateChanged: (dateTime) {},
                    ),
                  ],
                ),
              ),
            )),
  ],
);
