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

        final MainAxisAlignment actionsAlignment = context.knobs.options(
          label: 'Actions Alignment',
          options: _actionAlignmentOptions,
        );

        final bool barrierDismissible = context.knobs.boolean(
          label: 'Barrier Dismissible',
          initialValue: true,
        );

        Image? image;
        if (context.knobs.boolean(label: 'Image')) {
          image = Image.network(
            'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
            fit: BoxFit.cover,
            height: 100,
          );
        }

        List<Widget> listItem = [];
        if (context.knobs.boolean(label: 'List Items')) {
          listItem = [
            // ZeroListTile(
            //   title: 'List Tile 3',
            //   style: const ZeroListTileStyle(
            //     contentPadding: EdgeInsets.all(0),
            //     smallContentPadding: EdgeInsets.all(0),
            //   ),
            //   leftIcon: const Icon(Icons.person),
            //   rightIcon: ZeroCheckbox(value: true, tristate: true, onChanged: (val) {}),
            //   onTap: () {},
            // ),
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
          ];
        }

        return PreviewWidget(builder: (context) {
          return GestureDetector(
            onTap: () {
              ZeroAlertDialog().show(
                context,
                title: title,
                content: content,
                image: image,
                actionsAlignment: actionsAlignment,
                barrierDismissible: barrierDismissible,
                listItem: listItem,
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
