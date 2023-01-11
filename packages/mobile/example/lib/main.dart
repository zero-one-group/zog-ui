import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              ZeroButton.primary(
                onPressed: () {},
                text: 'Button',
                buttonSizeType: ButtonSizeType.small,
              ),
              ZeroButton.primary(
                onPressed: () {},
                text: 'Button',
                buttonSizeType: ButtonSizeType.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
