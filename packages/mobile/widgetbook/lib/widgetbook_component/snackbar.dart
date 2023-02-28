import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
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
          options: [
            const Option(label: 'Bottom', value: SnackbarPosition.bottom),
            const Option(label: 'Top', value: SnackbarPosition.top),
            const Option(label: 'Center', value: SnackbarPosition.center),
          ],
        );
        final Color backgroundColor = context.knobs.options(
          label: 'Background Color',
          options: _colorOptions.sublist(1),
        );
        final Color actionButtonTextColor = context.knobs.options(
          label: 'Button Text Color',
          options: _colorOptions.sublist(3),
        );
        final Color closeIconColor = context.knobs.options(
          label: 'Close Icon Color',
          options: _colorOptions.sublist(2),
        );
        final Color textColor = context.knobs.options(
          label: 'Text Color',
          options: _colorOptions.sublist(2),
        );

        return PreviewWidget(
          child: GestureDetector(
            onTap: () {
              ZeroSnackbar().show(
                context,
                text,
                duration: const Duration(seconds: 2),
                closeButton: closeButton,
                actionButton: actionButton,
                actionText: actionText,
                type: types,
                backgroundColor: backgroundColor,
                textStyle: TextStyle(color: textColor),
                actionButtonTextColor: actionButtonTextColor,
                closeIconColor: closeIconColor,
                position: position,
              );
            },
            child: const Text('Show Snackbar'),
          ),
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
        final ZeroSnackbarAlertType types = context.knobs.options(
          label: 'Type',
          options: [
            const Option(
                label: 'Solid Filled',
                value: ZeroSnackbarAlertType.solidFilled),
            const Option(label: 'Filled', value: ZeroSnackbarAlertType.filled),
            const Option(
                label: 'Outlined', value: ZeroSnackbarAlertType.outlined),
          ],
        );
        final ZeroSnackbarAlertVariant variant = context.knobs.options(
          label: 'Variant',
          options: [
            const Option(
                label: 'Danger', value: ZeroSnackbarAlertVariant.danger),
            const Option(
                label: 'Warning', value: ZeroSnackbarAlertVariant.warning),
            const Option(label: 'Info', value: ZeroSnackbarAlertVariant.info),
            const Option(
                label: 'Success', value: ZeroSnackbarAlertVariant.success),
          ],
        );
        final SnackbarPosition position = context.knobs.options(
          label: 'Position',
          options: [
            const Option(label: 'Bottom', value: SnackbarPosition.bottom),
            const Option(label: 'Top', value: SnackbarPosition.top),
            const Option(label: 'Center', value: SnackbarPosition.center),
          ],
        );
        final Widget actionWidget =
            context.knobs.options(label: 'Action Widget', options: [
          const Option(label: 'None', value: SizedBox()),
          const Option(label: 'Icon', value: Icon(Icons.close)),
          const Option(label: 'Text', value: Text('Action')),
        ]);
        final Color backgroundColor = context.knobs.options(
          label: 'Background Color',
          options: _colorOptions.sublist(8),
        );
        final Color iconColor = context.knobs.options(
          label: 'Icon Color',
          options: _colorOptions.sublist(1),
        );
        final BoxBorder boxBorder = Border.all(
          color: context.knobs.options(label: 'Border Color', options: [
            ..._colorOptions.sublist(_colorOptions.length - 1),
            ..._colorOptions
          ]),
        );
        return PreviewWidget(
          child: GestureDetector(
            onTap: () {
              ZeroSnackbarAlert().show(
                context,
                title: title,
                subtitle: subtitle,
                duration: const Duration(seconds: 2),
                type: types,
                variant: variant,
                backgroundColor: backgroundColor,
                iconColor: iconColor,
                actionWidget: actionWidget,
                subtitleTextStyle: const TextStyle(),
                titleTextStyle: const TextStyle(),
                border: boxBorder,
                position: position,
              );
            },
            child: const Text('Show Snackbar Alert'),
          ),
        );
      },
    ),
  ],
);

List<Option<Color>> _colorOptions = [
  const Option(label: 'Neutral', value: ZeroColors.neutral),
  const Option(label: 'White', value: ZeroColors.white),
  const Option(label: 'black', value: ZeroColors.black),
  const Option(label: 'Primary', value: ZeroColors.primary),
  const Option(label: 'Calendula Gold', value: ZeroColors.calendulaGold),
  const Option(label: 'Sunrise Yellow', value: ZeroColors.sunriseYellow),
  const Option(label: 'Lime', value: ZeroColors.lime),
  const Option(label: 'Polar Green', value: ZeroColors.polarGreen),
  const Option(label: 'Dust Red', value: ZeroColors.dustRed),
  const Option(label: 'Vocano', value: ZeroColors.vocano),
  const Option(label: 'Sunset Orange', value: ZeroColors.sunsetOrange),
  const Option(label: 'Geek Blue', value: ZeroColors.geekBlue),
  const Option(label: 'Golden Purple', value: ZeroColors.goldenPurple),
  const Option(label: 'Magenta', value: ZeroColors.magenta),
  const Option(label: 'Transparent', value: ZeroColors.transparent),
];
