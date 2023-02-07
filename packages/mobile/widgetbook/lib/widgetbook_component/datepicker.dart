import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

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
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 100)),
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
                      useRootNavigator: false,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now().add(const Duration(days: 100)),
                    );
                  }),
            )),
  ],
);
