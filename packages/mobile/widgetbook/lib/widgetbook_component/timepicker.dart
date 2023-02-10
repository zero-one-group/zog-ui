import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/utils.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent timepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Time Picker',
  useCases: [
    WidgetbookUseCase(
        name: '12 Hours',
        builder: (context) {
          return PreviewWidget.builder(
            builder: (context) => ZeroButton.primary(
              text: 'Time Picker',
              onPressed: () => showZeroTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ),
            ),
          );
        }),
    WidgetbookUseCase(
        name: '24 Hours',
        builder: (context) {
          return PreviewWidget.builder(
            builder: (context) => ZeroButton.primary(
              text: 'Time Picker',
              onPressed: () => showZeroTimePicker(
                context: context,
                use24hFormat: true,
                initialTime: TimeOfDay.now(),
              ),
            ),
          );
        }),
  ],
);
