import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/utils.dart';
import 'package:zog_ui/zog_ui.dart';

WidgetbookComponent timepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Time Picker',
  useCases: [
    WidgetbookUseCase(
        name: '12 Hours',
        builder: (context) {
          return PreviewWidget.builder(
            builder: (context) => ZeroButton.primary(
              child: const Text('Time Picker'),
              onPressed: () => showZeroTimePicker(
                context: context,
                useRootNavigator: false,
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
              child: const Text('Time Picker'),
              onPressed: () => showZeroTimePicker(
                context: context,
                useRootNavigator: false,
                use24hFormat: true,
                initialTime: TimeOfDay.now(),
              ),
            ),
          );
        }),
  ],
);
