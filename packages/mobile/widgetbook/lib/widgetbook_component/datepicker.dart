import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

List<Option<DateTime>> _initialDates = [
  Option(
    label: 'Now',
    value: DateTime.now(),
  ),
  Option(
    label: 'Yesterday',
    value: DateTime.now(),
  ),
  Option(
    label: 'Tomorrow',
    value: DateTime.now(),
  )
];

List<Option<DateTime>> _firstDates = [
  Option(
    label: 'Now',
    value: DateTime.now(),
  ),
  Option(
    label: '1 Month Ago',
    value: DateTime.now().subtract(const Duration(days: 30)),
  ),
  Option(
    label: '1 Year Ago',
    value: DateTime.now().subtract(const Duration(days: 365)),
  )
];

List<Option<DateTime>> _lastDates = [
  Option(
    label: 'Now',
    value: DateTime.now(),
  ),
  Option(
    label: '5 Month Later',
    value: DateTime.now().add(const Duration(days: 30 * 5)),
  ),
  Option(
    label: '5 Year Later',
    value: DateTime.now().add(const Duration(days: 365 * 5)),
  )
];

List<Option<DatePickerEntryMode>> _datePickerEntryModes = [
  const Option(label: 'Calendar First', value: DatePickerEntryMode.calendar),
  const Option(label: 'Calendar Only', value: DatePickerEntryMode.calendar),
  const Option(label: 'Input First', value: DatePickerEntryMode.input),
  const Option(label: 'Input Only ', value: DatePickerEntryMode.inputOnly)
];

List<Option<DatePickerMode>> _datePickerModes = [
  const Option(label: 'Days', value: DatePickerMode.day),
  const Option(label: 'Years', value: DatePickerMode.year),
];

WidgetbookComponent datepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Date Picker',
  useCases: [
    WidgetbookUseCase(
        name: 'Date Picker',
        builder: (context) => PreviewWidget.builder(
              theme: ZeroThemeData(),
              builder: (context) => ZeroButton.primary(
                  text: 'Date Picker',
                  onPressed: () async {
                    showZeroDatePicker(
                      context: context,
                      useRootNavigator: false,
                      helpText: context.knobs.text(label: 'Help Text'),
                      cancelText: context.knobs.text(label: 'Cancel Text'),
                      confirmText: context.knobs.text(label: 'OK Text'),
                      initialEntryMode: context.knobs.options(
                          label: 'Picker Entry Mode',
                          options: _datePickerEntryModes),
                      initialDatePickerMode: context.knobs.options(
                          label: 'Calender Picker Mode',
                          options: _datePickerModes),
                      initialDate: context.knobs.options(
                          label: 'Initial Date', options: _initialDates),
                      firstDate: context.knobs
                          .options(label: 'First Date', options: _firstDates),
                      lastDate: context.knobs
                          .options(label: 'Last Date', options: _lastDates),
                    );
                  }),
            )),
    WidgetbookUseCase(
        name: 'Date Range Picker',
        builder: (context) => PreviewWidget.builder(
              theme: ZeroThemeData(),
              builder: (context) => ZeroButton.primary(
                  text: 'Date Range Picker',
                  onPressed: () async {
                    showZeroDateRangePicker(
                      context: context,
                      helpText: context.knobs.text(label: 'Help Text'),
                      cancelText: context.knobs.text(label: 'Cancel Text'),
                      confirmText: context.knobs.text(label: 'OK Text'),
                      initialEntryMode: context.knobs.options(
                          label: 'Picker Entry Mode',
                          options: _datePickerEntryModes),
                      firstDate: context.knobs
                          .options(label: 'First Date', options: _firstDates),
                      lastDate: context.knobs
                          .options(label: 'Last Date', options: _lastDates),
                    );
                  }),
            )),
  ],
);
