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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ZeroSlider(),
                  ),
                ],
              ),
              Tooltip(
                message: 'data',
                child: const Text('data'),
              ),
              const SizedBox(height: 20),
              ZeroTooltip(
                type: ZeroTooltipType.dark,
                text: '90',
                onCreated: (controller) {
                  // controller(true);
                },
                showDuration: const Duration(seconds: 1),
                position: ZeroTooltipPosition.top,
                child: Container(
                  width: 200,
                  color: Colors.amber,
                  child: const Text('data rusak sekali'),
                ),
                variant: ZeroTooltipVariant.rectangle,
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
      ),
    );
  }
}
