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
    value: DateTime.now().subtract(const Duration(days: 1)),
  ),
  Option(
    label: 'Tomorrow',
    value: DateTime.now().subtract(const Duration(days: 1)),
  )
];

List<Option<DateTime>> _firstDates = [
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
      builder: (context) => ZeroDatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
      ),
    ),
    WidgetbookUseCase(
      name: 'Date Rage Picker',
      builder: (context) => ZeroDatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
      ),
    ),
  ],
);
