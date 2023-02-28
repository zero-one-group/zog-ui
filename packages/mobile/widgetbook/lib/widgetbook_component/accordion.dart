import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

List<Option<Widget?>> _iconsOption = [
  const Option(label: 'Not Set', value: null),
  const Option(label: 'Arrow Downward', value: Icon(Icons.arrow_downward)),
  const Option(label: 'Add', value: Icon(Icons.add)),
  const Option(label: 'Book', value: Icon(Icons.book)),
  const Option(label: 'Handshake', value: Icon(Icons.handshake))
];

WidgetbookComponent accordionWidgetbookComponent = WidgetbookComponent(
  name: 'Accordion',
  useCases: [
    WidgetbookUseCase(
        name: 'Underline',
        builder: (context) {
          ZeroExpansionTile child = const ZeroExpansionTile(
            title: Text('ZeroExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: [
              ListTile(title: Text('This is tile number 1')),
              ListTile(title: Text('This is tile number 1')),
            ],
          );

          return PreviewWidget.builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: ZeroAccordion.underline(
                leading: context.knobs
                    .options(label: 'Leading', options: _iconsOption),
                leadingRotateOnExpand: context.knobs.boolean(
                    label: 'Leading Rotate on Expansion', initialValue: false),
                trailing: context.knobs
                    .options(label: 'Trailing', options: _iconsOption),
                trailingRotateOnExpand: context.knobs.boolean(
                    label: 'Trailing Rotate on Expansion', initialValue: true),
                style: ZeroExpansionTileStyle.underline(
                    iconColor: context.knobs.options(
                        label: 'Icon Color', options: [...colorOptions]),
                    collapsedIconColor: context.knobs.options(
                        label: 'Collapsed Icon Color',
                        options: [...colorOptions]),
                    backgroundColor: context.knobs.options(
                        label: 'backgroundColor Color',
                        options: [
                          const Option(label: 'White', value: ZeroColors.white),
                          ...colorOptions
                        ]),
                    collapsedTextColor: context.knobs.options(
                        label: 'Collapsed Text Color',
                        options: [
                          const Option(label: 'Black', value: ZeroColors.black),
                          ...colorOptions
                        ]),
                    lineColor: context.knobs.options(
                        label: 'Line Color', options: [...colorOptions]),
                    collapsedLineColor: context.knobs
                        .options(label: 'Collapsed Line Color', options: [...colorOptions]),
                    childrenPadding: EdgeInsets.only(left: context.knobs.number(label: 'Children Left Padding', initialValue: 0.0) as double)),
                children: [child, child, child],
              ),
            ),
          );
        }),
    WidgetbookUseCase(
        name: 'Filled',
        builder: (context) {
          ZeroExpansionTile child = const ZeroExpansionTile(
            title: Text('ZeroExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: [
              ListTile(title: Text('This is tile number 1')),
              ListTile(title: Text('This is tile number 1')),
            ],
          );

          return PreviewWidget(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ZeroAccordion.filled(
                leading: context.knobs
                    .options(label: 'Leading', options: _iconsOption),
                leadingRotateOnExpand: context.knobs.boolean(
                    label: 'Leading Rotate on Expansion', initialValue: false),
                trailing: context.knobs
                    .options(label: 'Trailing', options: _iconsOption),
                trailingRotateOnExpand: context.knobs.boolean(
                    label: 'Trailing Rotate on Expansion', initialValue: true),
                style: ZeroExpansionTileStyle.filled(
                  iconColor: context.knobs
                      .options(label: 'Icon Color', options: [...colorOptions]),
                  collapsedIconColor: context.knobs.options(
                      label: 'Collapsed Icon Color',
                      options: [...colorOptions]),
                  collapsedTextColor: context.knobs.options(
                      label: 'Collapsed Text Color',
                      options: [
                        const Option(label: 'White', value: ZeroColors.white),
                        ...colorOptions
                      ]),
                  titleColor: context.knobs.options(
                      label: 'Title Background Color',
                      options: [...colorOptions]),
                  collapsedTitleColor: context.knobs.options(
                      label: 'Collapsed Title Backgronud Color',
                      options: [...colorOptions]),
                  childrenBackgroundColor: ZeroColors.white,
                  childrenPadding: EdgeInsets.only(
                      left: context.knobs.number(
                          label: 'Children Left Padding',
                          initialValue: 0.0) as double),
                ),
                children: [child, child, child],
              ),
            ),
          );
        }),
    WidgetbookUseCase(
        name: 'Sub Tile (Nested)',
        builder: (context) {
          ZeroExpansionTile subChild = const ZeroExpansionTile(
            title: Text('ZeroExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: [
              ListTile(title: Text('This is tile number 1')),
              ListTile(title: Text('This is tile number 1')),
            ],
          );

          ZeroExpansionTile child = ZeroExpansionTile(
            title: const Text('ZeroExpansionTile 1'),
            subtitle: const Text('Trailing expansion arrow icon'),
            children: [subChild, subChild],
          );

          return PreviewWidget.builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: ZeroAccordion.underline(
                leading: context.knobs
                    .options(label: 'Leading', options: _iconsOption),
                leadingRotateOnExpand: context.knobs.boolean(
                    label: 'Leading Rotate on Expansion', initialValue: false),
                trailing: context.knobs
                    .options(label: 'Trailing', options: _iconsOption),
                trailingRotateOnExpand: context.knobs.boolean(
                    label: 'Trailing Rotate on Expansion', initialValue: true),
                style: ZeroExpansionTileStyle.underline(
                    iconColor: context.knobs.options(
                        label: 'Icon Color', options: [...colorOptions]),
                    collapsedIconColor: context.knobs.options(
                        label: 'Collapsed Icon Color',
                        options: [...colorOptions]),
                    backgroundColor: context.knobs.options(
                        label: 'backgroundColor Color',
                        options: [
                          const Option(label: 'White', value: ZeroColors.white),
                          ...colorOptions
                        ]),
                    collapsedTextColor: context.knobs.options(
                        label: 'Collapsed Text Color',
                        options: [
                          const Option(label: 'Black', value: ZeroColors.black),
                          ...colorOptions
                        ]),
                    lineColor: context.knobs.options(
                        label: 'Line Color', options: [...colorOptions]),
                    collapsedLineColor: context.knobs
                        .options(label: 'Collapsed Line Color', options: [...colorOptions]),
                    childrenPadding: EdgeInsets.only(left: context.knobs.number(label: 'Children Left Padding', initialValue: 0.0) as double)),
                children: [child, child, child],
              ),
            ),
          );
        }),
  ],
);
