import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent snackbarWidgetbookComponent = WidgetbookComponent(
  name: 'Snackbar',
  useCases: [
    WidgetbookUseCase(
      name: 'Snackbar',
      builder: (context) {
        final String text = context.knobs.text(
          label: 'Text',
          initialValue:
              'this is a snackbar with a lot of text to show how it looks like when it is multiline',
        );
        final bool closeButton =
            context.knobs.boolean(label: 'Close Button', initialValue: false);
        final bool actionButton =
            context.knobs.boolean(label: 'Action Button', initialValue: false);
        final String actionText =
            context.knobs.text(label: 'Action Text', initialValue: 'Action');
        final ZeroSnackbarType types = context.knobs.options(
          label: 'Type',
          options: [
            const Option(
                label: 'Singleline', value: ZeroSnackbarType.singleline),
            const Option(label: 'Multiline', value: ZeroSnackbarType.multiline),
          ],
        );
        final SnackbarPosition position = context.knobs.options(
          label: 'Position',
          options: _positionOptions,
        );
        final backgroundColor = context.knobs.options(
          label: 'Background Color',
          options: _colorOptions,
        );
        final actionButtonTextColor = context.knobs.options(
          label: 'Button Text Color',
          options: _colorOptions,
        );
        final closeIconColor = context.knobs.options(
          label: 'Close Icon Color',
          options: _colorOptions,
        );
        final textColor = context.knobs.options(
          label: 'Text Color',
          options: _colorOptions,
        );
        final borderRadus = context.knobs
            .number(label: 'Border Radius', initialValue: 4)
            .toDouble();
        final elevation = context.knobs
            .number(label: 'Elevation', initialValue: 4)
            .toDouble();
        final icon =
            context.knobs.options(label: 'Close Icon', options: _iconOptions);

        return PreviewWidget(
          child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                ZeroSnackbar().show(
                  context,
                  text,
                  closeButton: closeButton,
                  actionButton: actionButton,
                  actionText: actionText,
                  type: types,
                  onClose: () {
                    ZeroSnackbar().hide();
                  },
                  actionOnPressed: () {
                    ZeroSnackbar().hide();
                  },
                  style: ZeroSnackbarStyle(
                    backgroundColor: backgroundColor,
                    textStyle: TextStyle(color: textColor),
                    borderRadius: BorderRadius.circular(borderRadus),
                    elevation: elevation,
                    actionStyle: TextStyle(color: actionButtonTextColor),
                    closeIcon:
                        icon != null ? Icon(icon, color: closeIconColor) : null,
                  ),
                  position: position,
                );
              },
              child: const Text('Show Snackbar'),
            );
          }),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Alert',
      builder: (context) {
        final String title = context.knobs.text(
          label: 'Title',
          initialValue: 'Title',
        );
        final String subtitle = context.knobs.text(
          label: 'Subtitle',
          initialValue: 'Subtitle',
        );

        final titleColor = context.knobs.options(
          label: 'Title Color',
          options: _colorOptions,
        );
        final subtitleColor = context.knobs.options(
          label: 'Subtitle Color',
          options: _colorOptions,
        );
        final ZeroSnackbarAlertType types = context.knobs.options(
          label: 'Type',
          options: _alertTypeOptions,
        );
        final ZeroSnackbarAlertVariant variant = context.knobs.options(
          label: 'Variant',
          options: _alertVariantOptions,
        );
        final SnackbarPosition position =
            context.knobs.options(label: 'Position', options: _positionOptions);
        final actionWidget = context.knobs
            .options(label: 'Action Widget', options: _actionOptions);
        final backgroundColor = context.knobs.options(
          label: 'Background Color',
          options: _colorOptions,
        );

        final BorderSide boxBorder = BorderSide(
          color: context.knobs
                  .options(label: 'Border Color', options: _colorOptions) ??
              Colors.transparent,
        );

        final borderRadus = context.knobs
            .number(label: 'Border Radius', initialValue: 4)
            .toDouble();

        final iconSize = context.knobs
            .number(label: 'Icon Size', initialValue: 22)
            .toDouble();

        return PreviewWidget(
          child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                ZeroSnackbarAlert().show(
                  context,
                  title: title,
                  subtitle: subtitle,
                  type: types,
                  variant: variant,
                  style: ZeroSnackbarAlertStyle(
                    color: backgroundColor,
                    border: boxBorder,
                    borderRadius: BorderRadius.circular(borderRadus),
                    subtitleStyle: TextStyle(color: subtitleColor),
                    titleStyle: TextStyle(color: titleColor),
                    iconSize: iconSize,
                  ),
                  action: actionWidget,
                  position: position,
                );
              },
              child: const Text('Show Snackbar Alert'),
            );
          }),
        );
      },
    ),
  ],
);

List<Option<Color?>> _colorOptions = [
  const Option(label: 'Default', value: null),
  ...colorOptions,
];

List<Option<IconData?>> _iconOptions = [
  const Option(label: 'Default', value: null),
  const Option(label: 'Close', value: ZeroIcons.close),
  const Option(label: 'Clear', value: ZeroIcons.clear),
  const Option(label: 'Folder Open', value: ZeroIcons.folderOpen),
  const Option(label: 'Compass', value: ZeroIcons.compass),
];

List<Option<ZeroSnackbarAlertType>> _alertTypeOptions = [
  const Option(label: 'Solid Filled', value: ZeroSnackbarAlertType.solidFilled),
  const Option(label: 'Filled', value: ZeroSnackbarAlertType.filled),
  const Option(label: 'Outlined', value: ZeroSnackbarAlertType.outlined),
];

List<Option<ZeroSnackbarAlertVariant>> _alertVariantOptions = [
  const Option(label: 'Danger', value: ZeroSnackbarAlertVariant.danger),
  const Option(label: 'Warning', value: ZeroSnackbarAlertVariant.warning),
  const Option(label: 'Info', value: ZeroSnackbarAlertVariant.info),
  const Option(label: 'Success', value: ZeroSnackbarAlertVariant.success),
];

List<Option<SnackbarPosition>> _positionOptions = [
  const Option(label: 'Bottom', value: SnackbarPosition.bottom),
  const Option(label: 'Top', value: SnackbarPosition.top),
  const Option(label: 'Center', value: SnackbarPosition.center),
];

List<Option<Widget?>> _actionOptions = [
  const Option(label: 'None', value: null),
  const Option(label: 'Icon', value: Icon(Icons.close)),
  const Option(label: 'Text', value: Text('Action')),
];
