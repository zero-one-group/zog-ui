import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent textWidgetbookComponent = WidgetbookComponent(
  name: 'Text',
  useCases: [
    WidgetbookUseCase(
      name: 'Heading 5',
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
      builder: (context) => Scaffold(
        body: Column(
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
  const Option(
    label: 'Primary 7',
    value: ZeroColors.primary7,
  ),
  const Option(
    label: 'Dust Red 7',
    value: ZeroColors.dustRed7,
  ),
  const Option(
    label: 'Polar Green 7',
    value: ZeroColors.polarGreen7,
  ),
  const Option(
    label: 'Sunset Orange 7',
    value: ZeroColors.sunsetOrange7,
  ),
];
