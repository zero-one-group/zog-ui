import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../options/options.dart';
import '../utils.dart';

WidgetbookComponent cardWidgetbookComponent = WidgetbookComponent(
  name: 'Card',
  useCases: [
    WidgetbookUseCase(
      name: 'Card Elevated',
      builder: (context) {
        return PreviewWidget(
          builder: (context) => ZeroCard(
            style: ZeroCardElevatedStyle(
              elevation: context.knobs
                  .number(label: 'Elevation', initialValue: 8)
                  .toDouble(),
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: [
                  const Option(label: 'White', value: ZeroColors.white),
                  ...colorOptions
                ],
              ),
              shadowColor: context.knobs.options(
                label: 'Shadow Color',
                options: [
                  const Option(label: 'Black', value: ZeroColors.black),
                  ...colorOptions
                ],
              ),
              borderRadius: BorderRadius.circular(context.knobs
                  .number(label: 'Border Radius', initialValue: 8)
                  .toDouble()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ZeroAvatar.initial(
                        'Elevated Card',
                        size: AvatarSize.m,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Elevated Card',
                              style: context.theme.typography.body1
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Text('ZeroCardElevatedStyle',
                              style: context.theme.typography.caption),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Image.network(
                      'https://picsum.photos/205',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Card Outlined',
      builder: (context) {
        return PreviewWidget(
          builder: (context) => ZeroCard(
            style: ZeroCardOutlinedStyle(
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: [
                  const Option(label: 'White', value: ZeroColors.white),
                  ...colorOptions
                ],
              ),
              side: BorderSide(
                color: context.knobs.options(
                  label: 'Border Color',
                  options: [
                    Option(
                        label: 'Theme Color',
                        value: context.theme.dividerColor),
                    ...colorOptions
                  ],
                ),
                width: context.knobs
                    .number(label: 'Border Width', initialValue: 1)
                    .toDouble(),
              ),
              borderRadius: BorderRadius.circular(context.knobs
                  .number(label: 'Border Radius', initialValue: 8)
                  .toDouble()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ZeroAvatar.initial(
                        'Outlined Card',
                        size: AvatarSize.m,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Outlined Card',
                              style: context.theme.typography.body1
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Text('ZeroCardOutlinedStyle',
                              style: context.theme.typography.caption),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Image.network(
                      'https://picsum.photos/206',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Card Filled',
      builder: (context) {
        return PreviewWidget(
          builder: (context) => ZeroCard(
            style: ZeroCardFilledStyle(
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: [
                  Option(
                      label: 'Theme Color', value: context.theme.primaryColor),
                  ...colorOptions
                ],
              ),
              borderRadius: BorderRadius.circular(context.knobs
                  .number(label: 'Border Radius', initialValue: 8)
                  .toDouble()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ZeroAvatar.initial(
                        'Filled Card',
                        size: AvatarSize.m,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Filled Card',
                              style: context.theme.typography.body1
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          Text('ZeroCardFileedStyle',
                              style: context.theme.typography.caption),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Image.network(
                      'https://picsum.photos/207',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  ],
);
