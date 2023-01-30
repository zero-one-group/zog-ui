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
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZeroSlider(
                activeColor: Colors.black,
                tickInterval: 25,
                tickBehavior: false,
                initialValue: 50,
                size: ZeroSliderSize.large,
                isDisabled: false,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                showTicks: true,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                tickBehavior: true,
                showTicks: true,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                tickBehavior: true,
                showTicks: true,
                size: ZeroSliderSize.small,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                activeColor: ZeroColors.danger,
                thumbColor: ZeroColors.polarGreen6,
                inactiveColor: ZeroColors.sunriseYellow6.withOpacity(.3),
                tickInterval: 25,
                tickBehavior: false,
                size: ZeroSliderSize.large,
                isDisabled: false,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                tickBehavior: false,
                size: ZeroSliderSize.large,
                isDisabled: false,
                tooltipVariant: ZeroTooltipVariant.custom,
              ),
              const SizedBox(height: 20),
              ZeroSlider(isDisabled: true),
              const SizedBox(height: 20),

              // Range Slider
              ZeroRangeSlider(
                initialvalues: const ZeroRangeValues(40, 55),
              ),
              const SizedBox(height: 20),
              ZeroRangeSlider(
                initialvalues: const ZeroRangeValues(40, 55),
                showTicks: true,
                tickBehavior: true,
              ),
              const SizedBox(height: 20),
              ZeroRangeSlider(
                initialvalues: const ZeroRangeValues(40, 55),
                showTicks: true,
                tickBehavior: true,
                size: ZeroSliderSize.small,
              ),
              const SizedBox(height: 20),
              ZeroRangeSlider(
                initialvalues: const ZeroRangeValues(40, 80),
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
