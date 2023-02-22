import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroCheckboxExample extends StatefulWidget {
  const ZeroCheckboxExample({super.key});

  @override
  State<ZeroCheckboxExample> createState() => _ZeroCheckboxExampleState();
}

class _ZeroCheckboxExampleState extends State<ZeroCheckboxExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero CheckBox Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          ZeroCheckbox(
            value: value,
            size: ZeroSizeType.small,
            onChanged: (v) {
              if (v != null) {
                setState(() {
                  value = v;
                });
              }
            },
          ),
          ZeroCheckbox(
            value: value,
            size: ZeroSizeType.medium,
            onChanged: (v) {
              if (v != null) {
                setState(() {
                  value = v;
                });
              }
            },
          ),
          ZeroCheckbox(
            value: value,
            size: ZeroSizeType.large,
            onChanged: (v) {
              if (v != null) {
                setState(() {
                  value = v;
                });
              }
            },
          ),
          ZeroCheckbox(
            value: value,
            size: ZeroSizeType.large,
            onChanged: (v) {},
            isDisabled: true,
          ),
          ZeroCheckbox(
            value: value,
            size: ZeroSizeType.large,
            style: ZeroCheckboxStyle(
              activeColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
              checkColor: Colors.green,
              inactiveColor: Colors.blue,
            ),
            onChanged: (v) {
              if (v != null) {
                setState(() {
                  value = v;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
