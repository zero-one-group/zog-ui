import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAccordionExample extends StatefulWidget {
  const ZeroAccordionExample({super.key});

  @override
  State<ZeroAccordionExample> createState() => _ZeroAccordionExampleState();
}

class _ZeroAccordionExampleState extends State<ZeroAccordionExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Accordion Example'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ZeroAccordion.underline(
                leading: const Icon(Icons.book),
                leadingRotateOnExpand: true,
                trailing: const Icon(Icons.arrow_downward),
                children: [
                  ZeroExpansionTile(
                    title: const Text('ZeroExpansionTile 1'),
                    subtitle: const Text('Trailing expansion arrow icon'),
                    style: ZeroExpansionTileStyle.underline(
                        iconColor: Colors.orange,
                        collapsedIconColor: Colors.blue,
                        backgroundColor: Colors.grey,
                        collapsedTextColor: Colors.amber,
                        lineColor: Colors.blue,
                        collapsedLineColor: Colors.green),
                    children: const [
                      ListTile(title: Text('This is tile number 1')),
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  const ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  const ZeroExpansionTile(
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
                children: [
                  ZeroExpansionTile(
                    title: const Text('ZeroExpansionTile 1'),
                    subtitle: const Text('Trailing expansion arrow icon'),
                    style: ZeroExpansionTileStyle.filled(
                      titleColor: ZeroColors.polarGreen,
                      collapsedTitleColor: ZeroColors.dustRed,
                      childrenBackgroundColor: ZeroColors.white,
                      iconColor: Colors.orange,
                      collapsedIconColor: Colors.blue,
                      collapsedTextColor: ZeroColors.sunsetOrange,
                    ),
                    children: const [
                      ListTile(title: Text('This is tile number 1')),
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  const ZeroExpansionTile(
                    title: Text('ZeroExpansionTile 1'),
                    subtitle: Text('Trailing expansion arrow icon'),
                    children: [
                      ListTile(title: Text('This is tile number 2')),
                    ],
                  ),
                  const ZeroExpansionTile(
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
