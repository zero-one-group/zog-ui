import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent alertDialogWidgetbookComponent = WidgetbookComponent(
  name: 'Alert Dialog',
  useCases: [
    WidgetbookUseCase(
      name: 'Alert Dialog',
      builder: (context) {
        final String title = context.knobs.text(
          label: 'Title Text',
          initialValue: 'Title',
        );
        final String content = context.knobs.text(
          label: 'Content Text',
          initialValue:
              'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
        );
        TextAlign contentAlignment = context.knobs.options(
          label: 'Content Alignment',
          options: _contentAlignmentOptions,
        );
        CrossAxisAlignment titleAlignment = context.knobs.options(
          label: 'Title Alignment',
          options: _titleAlignmentOptions,
        );
        final MainAxisAlignment actionsAlignment = context.knobs.options(
          label: 'Actions Alignment',
          options: _actionAlignmentOptions,
        );
        final bool barrierDismissible = context.knobs.boolean(
          label: 'Barrier Dismissible',
          initialValue: true,
        );
        bool image = context.knobs.boolean(label: 'Image');
        bool listItem = context.knobs.boolean(label: 'List Items');
        double borderRadius = context.knobs
            .number(
              label: 'Border Radius',
              initialValue: 16,
            )
            .toDouble();
        double elevation = context.knobs
            .number(
              label: 'Elevation',
              initialValue: 4,
            )
            .toDouble();

        return PreviewWidget(builder: (context) {
          return GestureDetector(
            onTap: () {
              ZeroAlertDialog().show(
                context,
                title: Column(
                  crossAxisAlignment: titleAlignment,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image) ...[
                      SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          'https://picsum.photos/100',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 16)
                    ],
                    Text(title),
                  ],
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      content,
                      textAlign: contentAlignment,
                    ),
                    if (listItem) ...[
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('List Tile 1'),
                        leading: const Icon(Icons.person),
                        trailing: ZeroCheckbox(value: false, onChanged: (val) {}),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('List Tile 2'),
                        leading: const Icon(Icons.person),
                        trailing: ZeroCheckbox(value: false, onChanged: (val) {}),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('List Tile 3'),
                        leading: const Icon(Icons.person),
                        trailing: ZeroCheckbox(value: false, onChanged: (val) {}),
                        onTap: () {},
                      ),
                    ]
                  ],
                ),
                elevation: elevation,
                actionsAlignment: actionsAlignment,
                barrierDismissible: barrierDismissible,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      ZeroAlertDialog().hide();
                    },
                    child: const Text('Action 1'),
                  ),
                  TextButton(
                    onPressed: () {
                      ZeroAlertDialog().hide();
                    },
                    child: const Text('Action 2'),
                  ),
                ],
              );
            },
            child: const Text('Show Alert Dialog'),
          );
        });
      },
    ),
  ],
);

List<Option<MainAxisAlignment>> _actionAlignmentOptions = [
  const Option(label: 'End', value: MainAxisAlignment.end),
  const Option(label: 'Start', value: MainAxisAlignment.start),
  const Option(label: 'Center', value: MainAxisAlignment.center),
];

List<Option<CrossAxisAlignment>> _titleAlignmentOptions = [
  const Option(label: 'Start', value: CrossAxisAlignment.start),
  const Option(label: 'Center', value: CrossAxisAlignment.center),
  const Option(label: 'End', value: CrossAxisAlignment.end),
];

List<Option<TextAlign>> _contentAlignmentOptions = [
  const Option(label: 'Start', value: TextAlign.start),
  const Option(label: 'Center', value: TextAlign.center),
  const Option(label: 'End', value: TextAlign.end),
];
