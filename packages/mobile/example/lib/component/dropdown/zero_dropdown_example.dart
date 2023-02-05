import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroDropdownExample extends StatelessWidget {
  ZeroDropdownExample({super.key});
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
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
          child: SingleChildScrollView(
            child: Column(children: [
              ZeroDropdown(
                onChanged: (p0) {},
                items: items,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                suffixIcon: const Icon(Icons.search),
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                suffixIcon: const Icon(Icons.search),
                selectedItemsStyle: SelectedItemsStyle.chip,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                suffixIcon: const Icon(Icons.search),
                selectedItemsStyle: SelectedItemsStyle.chipInverted,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
