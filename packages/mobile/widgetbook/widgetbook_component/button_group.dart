import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/components/button_group/zero_button_group.dart';
import 'package:zero_ui_mobile/types/button_size_type.dart';

WidgetbookComponent buttonGroupWidgetbookComponent = WidgetbookComponent(
  name: 'Button Group',
  useCases: [
    WidgetbookUseCase(
        name: 'Default',
        builder: (context) {
          const List<String> labels = ['Tab 1', 'Tab 2', 'Tab 3'];

          List<bool> isSelected = [false, false, false];
          return ZeroButtonGroup.labelsOnly(
            labels: labels,
            selectedItems: isSelected,
            buttonSizeType: ButtonSizeType.large,
          );
        }),
  ],
);
