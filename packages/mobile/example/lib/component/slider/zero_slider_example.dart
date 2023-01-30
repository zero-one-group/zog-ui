import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroSliderExample extends StatefulWidget {
  const ZeroSliderExample({super.key});

  @override
  State<ZeroSliderExample> createState() => _ZeroSliderExampleState();
}

class _ZeroSliderExampleState extends State<ZeroSliderExample> {
  double _value = 10;

  RangeValues _rangeValues = const RangeValues(10, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Slider Example'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ZeroSlider(
                  activeColor: Colors.black,
                  tickInterval: 25,
                  tickBehavior: true,
                  initialValue: 50,
                  size: ZeroSliderSize.large,
                  isDisabled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ZeroRangeSlider(
                initialvalues: const ZeroRangeValues(40, 55),
                tickInterval: 10,
                tickBehavior: true,
                showTicks: false,
                size: ZeroSliderSize.large,
                isDisabled: true,
              ),
            ),
            const SizedBox(height: 20),
            RangeSlider(
              min: 1,
              max: 100,
              values: _rangeValues,
              onChanged: (val) {
                setState(() {
                  _rangeValues = val;
                });
              },
            ),
            Slider(
              activeColor: Colors.amber,
              thumbColor: Colors.black,
              min: 1,
              secondaryTrackValue: 50,
              value: _value,
              max: 100,
              onChanged: (val) {
                setState(() {
                  _value = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
