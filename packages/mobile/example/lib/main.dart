import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';
import 'package:zero_ui_mobile_example/component/button/zero_button_example.dart';
import 'package:zero_ui_mobile_example/component/rating/zero_rating_example.dart';
import 'package:zero_ui_mobile_example/component/tooltip/zero_tooltip_example.dart';

import 'component/slider/zero_slider_example.dart';
import 'component/textfield/zero_textfield_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6'];
    List<String> labels = ['Search', 'Alarm', 'Calendar'];
    List<IconData> icons = [Icons.search, Icons.alarm, Icons.calendar_month];
    List<bool> isSelected = [false, false, false];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Examples(),
          ),
        ),
      ),
    );
  }
}

class Examples extends StatelessWidget {
  const Examples({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroButtonExample(),
                ),
              );
            },
            text: 'Zero Button Example',
          ),
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroTextfieldExample(),
                ),
              );
            },
            text: 'Zero Textfield Example',
          ),
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroRatingExample(),
                ),
              );
            },
            text: 'Zero Rating Example',
          ),
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroSliderExample(),
                ),
              );
            },
            text: 'Zero Slider Example',
          ),
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroTooltipExample(),
                ),
              );
            },
            text: 'Zero Tooltip Example',
          ),
        ],
      ),
    );
  }
}
