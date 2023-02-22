import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent accordionWidgetbookComponent = WidgetbookComponent(
  name: 'Accordion',
  useCases: [
    WidgetbookUseCase(
      name: 'Accordion',
      builder: (context) => PreviewWidget(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ZeroAccordion.underline(
            children: [
              const ZeroExpansionTile(
                title: Text('ZeroExpansionTile 1'),
                subtitle: Text('Trailing expansion arrow icon'),
                children: [
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: <Widget>[
                      ListTile(title: Text('This is tile number 1')),
                      ListTile(title: Text('This is tile number 1')),
                    ],
                  ),
                ],
              ),
              ZeroExpansionTile(
                title: const Text('ZeroExpansionTile 2'),
                subtitle: const Text('Custom expansion arrow icon'),
                children: const <Widget>[
                  ListTile(title: Text('This is tile number 2')),
                ],
                onExpansionChanged: (bool expanded) {},
              ),
              const ZeroExpansionTile(
                title: Text('ZeroExpansionTile 3'),
                subtitle: Text('Leading expansion arrow icon'),
                controlAffinity: ListTileControlAffinity.leading,
                children: <Widget>[
                  ListTile(title: Text('This is tile number 3')),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);
