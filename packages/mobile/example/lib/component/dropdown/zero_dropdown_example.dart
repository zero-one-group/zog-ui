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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                inputDecorationType: InputDecorationType.underline,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.icon(
                onChanged: (p0) {},
                items: items,
                icon: const ClipOval(
                  child: Material(
                    color: Colors.blue, // Button color
                    child: InkWell(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
                labelText: 'Label text',
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
                labelText: 'Label text',
                onChanged: (p0) {},
                items: items,
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                textfieldSize: ZeroTextfieldSize.large,
                suffixIcon: const Icon(Icons.search),
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                labelText: 'Label text',
                hintText: 'Hint text',
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                suffixIcon: const Icon(Icons.search),
                selectedItemsStyle: SelectedItemsStyle.chipInverted,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroDropdown.multiple(
                onChanged: (p0) {},
                items: items,
                labelText: 'Label text large',
                hintText: 'Hint text',
                multipleItemsVariant: MultipleItemsVariant.checkboxes,
                textfieldSize: ZeroTextfieldSize.large,
                suffixIcon: const Icon(Icons.search),
                selectedItemsStyle: SelectedItemsStyle.chipInverted,
              ),
              const SizedBox(
                height: 20,
              ),
              ZeroDropdown(
                items: items,
                hintText: 'Hint ',
                inputDecorationType: InputDecorationType.outline,
                onChanged: (value) {},
                textfieldSize: ZeroTextfieldSize.small,
                suffixIcon: const Icon(Icons.search),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
