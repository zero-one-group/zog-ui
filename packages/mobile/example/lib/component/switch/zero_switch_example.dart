import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/switch/zero_switch.dart';
import 'package:zero_ui_mobile/components/switch/zero_switch_android.dart';
import 'package:zero_ui_mobile/components/switch/zero_switch_ios.dart';
import 'package:zero_ui_mobile/styles/colors.dart';

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
        title: const Text('Zero Tooltip Example'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ZeroSwitch(
                onChanged: (val) {},
                isDisabled: false,
                initialValue: true,
                activeIcon: const Icon(Icons.sunny),
                inactiveIcon: const Icon(Icons.nightlight_round),
              ),
              ZeroSwitchAndroid(
                onChanged: (val) {},
                isDisabled: false,
                initialValue: true,
                activeIcon: const Icon(Icons.check),
                inactiveIcon: const Icon(Icons.close),
              ),
              ZeroSwitchIOS(
                onChanged: (val) {},
                isDisabled: false,
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
