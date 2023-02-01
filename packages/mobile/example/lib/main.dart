import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'component/avatar/avatar_example.dart';
import 'component/button/zero_button_example.dart';
import 'component/divider/divider_example.dart';
import 'component/rating/zero_rating_example.dart';
import 'component/slider/zero_slider_example.dart';
import 'component/textfield/zero_textfield_example.dart';
import 'component/tooltip/zero_tooltip_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      title: 'Flutter Demo',
      theme: ZeroThemeData(
        brightness: Brightness.light,
        primaryColor: ZeroColors.lime.toAccentColor(),
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
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroAvatarExample(),
                ),
              );
            },
            text: 'Zero Avatar Example',
          ),
          ZeroButton.primary(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ZeroDividerExample(),
                ),
              );
            },
            text: 'Zero Divider Example',
          ),
        ],
      ),
    );
  }
}
