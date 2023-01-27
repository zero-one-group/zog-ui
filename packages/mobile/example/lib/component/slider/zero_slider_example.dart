import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/tooltip/zero_tooltip_style.dart';
import 'package:zero_ui_mobile/position/tooltip_position.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroSliderExample extends StatefulWidget {
  const ZeroSliderExample({super.key});

  @override
  State<ZeroSliderExample> createState() => _ZeroSliderExampleState();
}

class _ZeroSliderExampleState extends State<ZeroSliderExample> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Slider Example'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Tooltip(
              message: 'Tooltip',
              child: const Text('Tooltip'),
            ),
            // const SizedBox(height: 20),
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: ZeroSlider(),
            ),
            const SizedBox(height: 20),
            RangeSlider(
              min: 1,
              max: 100,
              values: RangeValues(10, 50),
              onChanged: (val) {},
            ),
            Slider(
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
