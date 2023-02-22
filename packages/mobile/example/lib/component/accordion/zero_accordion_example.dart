import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroAccordionExample extends StatefulWidget {
  const ZeroAccordionExample({super.key});

  @override
  State<ZeroAccordionExample> createState() => _ZeroAccordionExampleState();
}

class _ZeroAccordionExampleState extends State<ZeroAccordionExample> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Accordion Example'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ZeroAccordion.underline(
                children: const [
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 1')),
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const ZeroDivider.horizontal(),
              const SizedBox(
                height: 20,
              ),
              ZeroAccordion.filled(
                children: const [
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 1')),
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
