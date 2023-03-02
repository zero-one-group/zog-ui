import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent textWidgetbookComponent = WidgetbookComponent(
  name: 'Typography',
  useCases: [
    WidgetbookUseCase(
      name: 'Heading 1',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading1(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 1',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Heading 2',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading2(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 2',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Heading 3',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading3(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 3',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Heading 4',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading4(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 4',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Heading 5',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading5(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 5',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Heading 6',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.heading6(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Heading 6',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Subtitle 1',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.subtitle1(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Subtitle 1',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Subtitle 2',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.subtitle2(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Subtitle 2',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Body 1',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.body1(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Body 1',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Body 2',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.body2(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Body 2',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Button',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.button(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Button',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Caption',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.caption(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Caption',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Overline',
      builder: (context) => PreviewWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: ZeroText.overline(
                context.knobs.text(
                  label: 'Value',
                  initialValue: 'Overline',
                ),
                align: context.knobs
                    .options(label: 'Text Align', options: _aligns),
                maxLine: context.knobs
                    .number(label: 'Max Line', initialValue: 1)
                    .toInt(),
                overflow: context.knobs
                    .options(label: 'Text Overflow', options: _overflows),
                softWrap: context.knobs.nullableBoolean(label: 'Soft Wrap'),
                style: TextStyle(
                  color: context.knobs.options(
                    label: 'Color',
                    options: _colorOptions,
                  ),
                  fontWeight:
                      context.knobs.nullableBoolean(label: 'Text Bold') == true
                          ? FontWeight.bold
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Global Theme',
      builder: (context) {
        return PreviewWidget(
          theme: ZeroThemeData(
            typography:
                ZeroTypography.fromBrightness(brightness: Brightness.light)
                    .apply(
              color: context.knobs.options(
                label: 'Color',
                options: _colorOptions,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text('Heading 5: '),
              ZeroText.heading5(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Heading 6: '),
              ZeroText.heading6(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Subtitle 1: '),
              ZeroText.subtitle1(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Subtitle 2: '),
              ZeroText.subtitle2(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Body 1: '),
              ZeroText.body1(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Body 2: '),
              ZeroText.body2(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Button: '),
              ZeroText.button(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Caption: '),
              ZeroText.caption(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 16),
              const Text('Overline: '),
              ZeroText.overline(context.knobs.text(
                label: 'Value',
                initialValue: 'Text value',
              )),
              const SizedBox(height: 50),
            ],
          ),
        );
      },
    ),
  ],
);

List<Option<TextAlign>> _aligns = [
  const Option(label: 'Left', value: TextAlign.left),
  const Option(label: 'Center', value: TextAlign.center),
  const Option(label: 'Right', value: TextAlign.right),
  const Option(label: 'Justify', value: TextAlign.justify),
];

List<Option<TextOverflow>> _overflows = [
  const Option(label: 'Clip', value: TextOverflow.clip),
  const Option(label: 'Ellipses', value: TextOverflow.ellipsis),
  const Option(label: 'Fade', value: TextOverflow.fade),
  const Option(label: 'Visible', value: TextOverflow.visible),
];

List<Option<Color>> _colorOptions = [
  const Option(
    label: 'Black',
    value: ZeroColors.black,
  ),
  Option(
    label: 'Primary 7',
    value: ZeroColors.primary[7],
  ),
  Option(
    label: 'Dust Red 7',
    value: ZeroColors.dustRed[7],
  ),
  Option(
    label: 'Polar Green 7',
    value: ZeroColors.polarGreen[7],
  ),
  Option(
    label: 'Sunset Orange 7',
    value: ZeroColors.sunsetOrange[7],
  ),
];
