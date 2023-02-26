import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroSwitchExample extends StatefulWidget {
  const ZeroSwitchExample({super.key});

  @override
  State<ZeroSwitchExample> createState() => _ZeroSwitchExampleState();
}

class _ZeroSwitchExampleState extends State<ZeroSwitchExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Switch Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ZeroSwitch(
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                },
                value: value,
                isDisabled: false,
                activeIcon: const Icon(Icons.sunny),
                inactiveIcon: const Icon(Icons.nightlight_round),
              ),
              ZeroSwitchAndroid(
                value: value,
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                },
                isDisabled: false,
                activeIcon: const Icon(Icons.check),
                inactiveIcon: const Icon(Icons.close),
              ),
              ZeroSwitchIOS(
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                },
                value: value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
