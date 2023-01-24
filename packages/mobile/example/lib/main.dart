import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield_multiline.dart';
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  errorText: 'Error Text',
                  helperText: 'Support Text',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label Large',
                  hintText: 'Input Large',
                  helperText: 'Support Text Large',
                  textfielSizeType: TextfieldSizeType.large,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label Small',
                  hintText: 'Input Small',
                  helperText: 'Support Text Small',
                  textfielSizeType: TextfieldSizeType.small,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.rounded(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: IconButton(
                      icon: const Icon(Icons.delete_forever), onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
