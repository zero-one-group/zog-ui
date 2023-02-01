import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent timepickerWidgetbookComponent = WidgetbookComponent(
  name: 'Dropdown',
  useCases: [
    WidgetbookUseCase(
        name: 'Default',
        builder: (context) {
          return Center(child: Container());
        }),
  ],
);
