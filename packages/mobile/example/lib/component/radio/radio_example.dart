import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroRadioExample extends StatefulWidget {
  const ZeroRadioExample({super.key});

  @override
  State<ZeroRadioExample> createState() => _ZeroRadioExampleState();
}

class _ZeroRadioExampleState extends State<ZeroRadioExample> {
  String value = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero Radio Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          ZeroRadioGroup(
            value: 'a',
            groupValue: value,
            size: ZeroSizeType.small,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),
          const SizedBox(height: 12),
          ZeroRadioGroup(
              value: 'b',
              size: ZeroSizeType.medium,
              groupValue: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              }),
          const SizedBox(height: 12),
          ZeroRadioGroup(
              value: 'c',
              size: ZeroSizeType.large,
              groupValue: value,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              }),
          const SizedBox(height: 12),
          ZeroRadioGroup(
              value: 'd',
              size: ZeroSizeType.large,
              groupValue: value,
              customSelected: true,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              }),
          const SizedBox(height: 12),
          ZeroRadioGroup(
              value: 'e',
              size: ZeroSizeType.large,
              groupValue: value,
              isDisabled: true,
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              }),
          const SizedBox(height: 12),
          ZeroRadioGroup(
              value: 'f',
              size: ZeroSizeType.large,
              groupValue: value,
              style: const ZeroRadioStyle(
                inactiveColor: Colors.pink,
                activeColor: Colors.cyan,
              ),
              onChanged: (v) {
                setState(() {
                  value = v;
                });
              }),
        ],
      ),
    );
  }
}
