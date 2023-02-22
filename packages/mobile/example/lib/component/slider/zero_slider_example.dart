import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroSliderExample extends StatefulWidget {
  const ZeroSliderExample({super.key});

  @override
  State<ZeroSliderExample> createState() => _ZeroSliderExampleState();
}

class _ZeroSliderExampleState extends State<ZeroSliderExample> {
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
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const ZeroSlider(
                    style: ZeroSliderStyle(
                      activeColor: Colors.black,
                      thumbColor: Colors.black,
                    ),
                    tickInterval: 25,
                    initialValue: 50,
                    size: ZeroSliderSize.large,
                    isDisabled: false,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                tickInterval: 25,
                showTicks: true,
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                tickInterval: 25,
                style: ZeroSliderStyle(tickBehavior: true),
                showTicks: true,
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                tickInterval: 25,
                style: ZeroSliderStyle(tickBehavior: true),
                showTicks: true,
                size: ZeroSliderSize.small,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                style: ZeroSliderStyle(
                  tickBehavior: true,
                  activeColor: ZeroColors.danger,
                  thumbColor: ZeroColors.polarGreen,
                  inactiveColor: ZeroColors.sunriseYellow.withOpacity(.3),
                ),
                size: ZeroSliderSize.large,
                isDisabled: false,
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                tickInterval: 25,
                size: ZeroSliderSize.large,
                isDisabled: false,
                style: ZeroSliderStyle(
                  tooltipVariant: ZeroTooltipVariant.custom,
                ),
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                isDisabled: true,
                initialValue: 33,
              ),
              const SizedBox(height: 20),

              // Range Slider
              Container(
                padding: const EdgeInsets.all(20.0),
                width: 300,
                child: const ZeroRangeSlider(
                  initialvalues: ZeroRangeValues(40, 60),
                  size: ZeroSliderSize.small,
                  isDisabled: false,
                  tickInterval: 5,
                ),
              ),
              const SizedBox(height: 20),
              const ZeroRangeSlider(
                initialvalues: ZeroRangeValues(40, 55),
                showTicks: true,
                style: ZeroSliderStyle(tickBehavior: true),
                tickInterval: 5,
              ),
              const SizedBox(height: 20),
              const ZeroRangeSlider(
                initialvalues: ZeroRangeValues(40, 55),
                showTicks: true,
                style: ZeroSliderStyle(tickBehavior: true),
                size: ZeroSliderSize.small,
              ),
              const SizedBox(height: 20),
              const ZeroRangeSlider(
                initialvalues: ZeroRangeValues(40, 80),
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
