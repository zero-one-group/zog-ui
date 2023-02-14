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
            children: const [
              _ZeroSwitchExample(),
              _ZeroSwitchAndroidExample(),
              _ZeroSwitchIOSExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZeroSwitchExample extends StatefulWidget {
  const _ZeroSwitchExample();

  @override
  State<_ZeroSwitchExample> createState() => __ZeroSwitchExampleState();
}

class __ZeroSwitchExampleState extends State<_ZeroSwitchExample> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ZeroSwitch(
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
      isDisabled: false,
      value: value,
      activeIcon: const Icon(Icons.sunny),
      inactiveIcon: const Icon(Icons.nightlight_round),
    );
  }
}

class _ZeroSwitchAndroidExample extends StatefulWidget {
  const _ZeroSwitchAndroidExample();

  @override
  State<_ZeroSwitchAndroidExample> createState() => __ZeroSwitchAndroidExampleState();
}

class __ZeroSwitchAndroidExampleState extends State<_ZeroSwitchAndroidExample> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ZeroSwitchAndroid(
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
      isDisabled: false,
      value: value,
      activeIcon: const Icon(Icons.check),
      inactiveIcon: const Icon(Icons.close),
    );
  }
}

class _ZeroSwitchIOSExample extends StatefulWidget {
  const _ZeroSwitchIOSExample();

  @override
  State<_ZeroSwitchIOSExample> createState() => __ZeroSwitchIOSExampleState();
}

class __ZeroSwitchIOSExampleState extends State<_ZeroSwitchIOSExample> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ZeroSwitchIOS(
      onChanged: (newValue) {
        setState(() {
          value = newValue;
        });
      },
      isDisabled: false,
      value: value,
    );
  }
}
