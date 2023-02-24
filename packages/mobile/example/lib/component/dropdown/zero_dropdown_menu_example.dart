import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroDropdownMenuExample extends StatelessWidget {
  ZeroDropdownMenuExample({super.key});
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Dropdown Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              ZeroDropdownMenu(
                inputDecorationType: InputDecorationType.fill,
                onSelected: (p0) {},
                width: 400,
                enableFilter: true,
                trailingIcon: const Icon(Icons.close_outlined),
                leadingIcon: const Icon(Icons.account_box),
                hintText: 'Hint text',
                items: items,
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
