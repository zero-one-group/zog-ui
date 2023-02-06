import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent datepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Date Picker',
  useCases: [
    WidgetbookUseCase(
        name: 'Date Picker',
        builder: (context) => ZeroApp(
              home: PreviewWidget(
                child: ZeroButton.primary(
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
              ),
            )),
    WidgetbookUseCase(
      name: 'Date Rage Picker',
      builder: (context) => PreviewWidget(
        child: ZeroDateRangePickerDialog(
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 100)),
        ),
      ),
    ),
  ],
);
