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
            children: [
              ZeroSwitch(
                onChanged: (val) {},
                isDisabled: true,
                initialValue: true,
                activeIcon: const Icon(Icons.sunny),
                inactiveIcon: const Icon(Icons.nightlight_round),
              ),
              ZeroSwitchAndroid(
                onChanged: (val) {},
                isDisabled: true,
                initialValue: true,
                activeIcon: const Icon(Icons.check),
                inactiveIcon: const Icon(Icons.close),
              ),
              ZeroSwitchIOS(
                onChanged: (val) {},
                isDisabled: true,
                initialValue: true,
                // inactiveColor: Colors.red,
                // activeColor: Colors.green,

                // activeThumbColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
