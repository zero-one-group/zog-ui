import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/assets/assets.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? checkValue;
  @override
  Widget build(BuildContext context) {
    const List<String> labels = ['Tab 1', 'Tab 2', 'Tab 3'];
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
              // Checkbox(
              //   tristate: true,
              //   value: checkValue,
              //   onChanged: (val) {
              //     setState(() {
              //       checkValue = val;
              //     });
              //   },
              // ),

              ZeroButton.text(
                text: 'Button Text',
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.curved,
                buttonSizeType: ZeroSizeType.large,
                isDisabled: false,
                width: 180,
                height: 60,
              ),

              ZeroButtonIcon.text(
                icon: const Icon(Icons.search),
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.curved,
                buttonSizeType: ZeroSizeType.large,
                isDisabled: true,
                width: 180,
                height: 60,
              ),

              ZeroButtonLIcon.text(
                icon: const Icon(Icons.search),
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                buttonSizeType: ZeroSizeType.large,
                isDisabled: true,
                width: 180,
                height: 60,
                text: 'Button Text',
              ),

              ZeroButtonRIcon.text(
                icon: const Icon(Icons.search),
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                buttonSizeType: ZeroSizeType.large,
                isDisabled: false,
                width: 180,
                height: 60,
                text: 'Button Text',
              ),

              ZeroButtonRLIcon.text(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.search),
                onPressed: () {},
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                buttonSizeType: ZeroSizeType.large,
                isDisabled: false,
                width: 250,
                height: 60,
                text: 'Button Text',
              ),

              // ZeroRating(
              //   itemCount: 5,
              //   spacing: 5,
              //   minValue: 1,
              //   initialValue: 3,
              //   allowHalfRating: true,
              //   sizeType: ZeroSizeType.large,
              //   isDisabled: false,
              //   ratingWidget: RatingWidget(
              //     full: const Icon(
              //       Icons.star,
              //       color: Colors.amber,
              //     ),
              //     half: const Icon(
              //       Icons.star,
              //       color: Colors.yellow,
              //     ),
              //     empty: const Icon(
              //       Icons.star,
              //       color: Colors.black12,
              //     ),
              //   ),
              //   onRatingUpdate: (val) {},
              // ),
              // const SizedBox(height: 20),
              // ZeroRatingCustom(
              //   spacing: 4,
              //   initialValue: 1,
              //   isDisabled: false,
              //   activeColor: ZeroColors.sunriseYellow6,
              //   inactiveColor: ZeroColors.neutral5,
              //   sizeType: ZeroSizeType.small,
              //   onRatingUpdate: (val) {
              //     log(val.toString());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
