import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroButtonGroupExample extends StatefulWidget {
  const ZeroButtonGroupExample({super.key});

  @override
  State<ZeroButtonGroupExample> createState() => _ZeroButtonGroupExampleState();
}

class _ZeroButtonGroupExampleState extends State<ZeroButtonGroupExample> {
  List<bool> _selectedItems = [false, false, false];
  List<bool> _selectedItems2 = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero Button Group Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            // ======================> BASIC STYLE <============================
            ZeroButtonGroup.labelsOnly(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              selecteds: _selectedItems,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
              buttonSizeType: ZeroSizeType.medium,
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.iconsOnly(
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsWithIcons(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),

            // ======================> OUTLINED STYLE <=========================
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsOnly(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.outlined,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.iconsOnly(
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.outlined,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsWithIcons(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.outlined,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            // ======================> UNDERLINE STYLE <=========================
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsOnly(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.underline,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.iconsOnly(
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.underline,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsWithIcons(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.underline,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            // ======================> TEXT STYLE <=============================
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsOnly(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.text,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.iconsOnly(
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.text,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsWithIcons(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              icons: const [ZeroIcons.aim, ZeroIcons.node, ZeroIcons.number],
              selecteds: _selectedItems,
              buttonGroupType: ButtonGroupType.text,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ZeroButtonGroup.labelsOnly(
              labels: const ['Text 1', 'Text 2', 'Text 3'],
              selecteds: _selectedItems,
              onChanged: (value) {
                setState(() {
                  _selectedItems = value;
                });
              },
              buttonSizeType: ZeroSizeType.medium,
              style: const ZeroButtonGroupFilledStyle(
                activeColor: Colors.yellow,
                inactiveColor: Colors.green,
                activeTextStyle: TextStyle(color: Colors.pink),
                inactiveTextStyle: TextStyle(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ZeroButtonGroup.labelsOnly(
                  labels: const [
                    'Text 1',
                    'Text 2',
                    'Text 3',
                    'Text 4',
                    'Text 5'
                  ],
                  selecteds: _selectedItems2,
                  vertical: true,
                  onChanged: (value) {
                    setState(() {
                      _selectedItems2 = value;
                    });
                  },
                  buttonSizeType: ZeroSizeType.medium,
                  multipleSelect: true,
                ),
                const SizedBox(width: 20),
                ZeroButtonGroup.labelsWithIcons(
                  labels: const [
                    'Text 1',
                    'Text 2',
                    'Text 3',
                    'Text 4',
                    'Text 5'
                  ],
                  icons: const [
                    ZeroIcons.aim,
                    ZeroIcons.node,
                    ZeroIcons.number,
                    ZeroIcons.accountBook,
                    ZeroIcons.audit
                  ],
                  selecteds: _selectedItems2,
                  vertical: true,
                  onChanged: (value) {
                    setState(() {
                      _selectedItems2 = value;
                    });
                  },
                  buttonSizeType: ZeroSizeType.medium,
                  multipleSelect: true,
                  buttonGroupType: ButtonGroupType.underline,
                ),
                const SizedBox(width: 20),
                ZeroButtonGroup.iconsOnly(
                  icons: const [
                    ZeroIcons.aim,
                    ZeroIcons.node,
                    ZeroIcons.number,
                    ZeroIcons.accountBook,
                    ZeroIcons.audit
                  ],
                  selecteds: _selectedItems2,
                  vertical: true,
                  multipleSelect: true,
                  buttonGroupType: ButtonGroupType.outlined,
                  onChanged: (value) {
                    setState(() {
                      _selectedItems2 = value;
                    });
                  },
                  buttonSizeType: ZeroSizeType.medium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
