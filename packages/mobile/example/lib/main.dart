import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> children = <Widget>[
      Text('Tab 1'),
      Text('Tab 2'),
      Text('Tab 3')
    ];

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
              ZeroButtonGroup.solid(
                selectedItems: isSelected,
                buttonSizeType: ButtonSizeType.small,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.outline(
                buttonSizeType: ButtonSizeType.small,
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.solid(
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.outline(
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.solid(
                selectedItems: isSelected,
                buttonSizeType: ButtonSizeType.large,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.outline(
                buttonSizeType: ButtonSizeType.large,
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.solid(
                buttonSizeType: ButtonSizeType.large,
                buttonRadiusType: ButtonRadiusType.rounded,
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.text(
                buttonSizeType: ButtonSizeType.large,
                selectedItems: isSelected,
                children: children,
              ),
              const SizedBox(
                height: 10,
              ),
              ZeroButtonGroup.underline(
                buttonSizeType: ButtonSizeType.large,
                selectedItems: isSelected,
                children: children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
