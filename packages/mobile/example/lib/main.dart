import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> labels = ['Tab 1', 'Tab 2', 'Teb 3'];
    List<bool> isSelected = [false, false, false];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZeroButton(
                onPressed: () {},
                style: ZeroButtonStyle.secondaryStyle(),
                child: const Text('fda'),
              ),
              ZeroButton.primary(
                text: 'Button Primary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
              ),
              ZeroButton.secondary(
                text: 'Button Secondary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
              ),
              ZeroButton.disabled(
                text: 'Button Disabled',
                buttonRadiusType: ZeroButtonRadiusType.rounded,
              ),
              ZeroButtonLIcon.primary(
                text: 'Button L-Icon Primary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                icon: const Icon(Icons.search),
              ),
              ZeroButtonLIcon.secondary(
                text: 'Button L-Icon Primary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                icon: const Icon(Icons.search),
              ),
              ZeroButtonLIcon.disabled(
                text: 'Button L-Icon Primary',
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                icon: const Icon(Icons.search),
              ),
              ZeroButtonRLIcon.primary(
                text: 'Button LR-Icon Primary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.search),
              ),
              ZeroButtonRLIcon.secondary(
                text: 'Button LR-Icon Primary',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.search),
              ),
              ZeroButtonRLIcon.disabled(
                text: 'Button LR-Icon Primary',
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.search),
              ),
              ZeroButtonIcon.primary(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              ZeroButtonIcon.secondary(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              ZeroButtonIcon.disabled(
                icon: const Icon(Icons.search),
              ),
              ZeroButtonIcon(
                onPressed: () {},
                style: ZeroButtonStyle.secondaryStyle(),
                child: const Icon(Icons.abc, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
