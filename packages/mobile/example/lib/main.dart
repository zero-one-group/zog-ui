import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/assets/assets.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
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

              ZeroRating(
                itemCount: 5,
                spacing: 5,
                minValue: 1,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                isDisabled: false,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  half: const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  empty: const Icon(
                    Icons.star,
                    color: Colors.black12,
                  ),
                ),
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRatingCustom(
                spacing: 4,
                initialValue: 1,
                isDisabled: false,
                activeColor: ZeroColors.sunriseYellow6,
                inactiveColor: ZeroColors.neutral5,
                sizeType: ZeroSizeType.small,
                onRatingUpdate: (val) {
                  log(val.toString());
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: ZeroTextField(
                  labelText: 'Name',
                  hintText: 'Input',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
