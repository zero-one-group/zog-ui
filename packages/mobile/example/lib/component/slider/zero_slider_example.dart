import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroSliderExample extends StatefulWidget {
  const ZeroSliderExample({super.key});

  @override
  State<ZeroSliderExample> createState() => _ZeroSliderExampleState();
}

class _ZeroSliderExampleState extends State<ZeroSliderExample> {
  double value1 = 10;
  double value2 = 0;
  ZeroRangeValues value3 = const ZeroRangeValues(40, 60);

  void _onChangeValue1(double newValue) {
    setState(() {
      value1 = newValue;
    });
  }

  void _onChangeValue2(double newValue) {
    setState(() {
      value2 = newValue;
    });
  }

  void _onChangeValue3(ZeroRangeValues newValue) {
    setState(() {
      value3 = newValue;
    });
  }

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
                  child: ZeroSlider(
                    style: const ZeroSliderStyle(
                      activeColor: Colors.black,
                      thumbColor: Colors.black,
                    ),
                    value: value1,
                    onChanged: _onChangeValue1,
                    size: ZeroSliderSize.large,
                    isDisabled: false,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                showTicks: true,
                style: const ZeroSliderStyle(tickBehavior: true),
                value: value2,
                onChanged: _onChangeValue2,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                style: const ZeroSliderStyle(tickBehavior: true),
                showTicks: true,
                value: value1,
                onChanged: _onChangeValue1,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                style: const ZeroSliderStyle(tickBehavior: true),
                showTicks: true,
                size: ZeroSliderSize.small,
                value: value2,
                onChanged: _onChangeValue2,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                style: ZeroSliderStyle(
                  activeColor: ZeroColors.danger,
                  thumbColor: ZeroColors.polarGreen,
                  inactiveColor: ZeroColors.sunriseYellow.withOpacity(.3),
                ),
                size: ZeroSliderSize.large,
                isDisabled: false,
                value: value1,
                onChanged: _onChangeValue1,
              ),
              const SizedBox(height: 20),
              ZeroSlider(
                tickInterval: 25,
                size: ZeroSliderSize.large,
                isDisabled: false,
                style: const ZeroSliderStyle(
                  tooltipVariant: ZeroTooltipVariant.custom,
                ),
                value: value2,
                onChanged: _onChangeValue2,
              ),
              const SizedBox(height: 20),
              const ZeroSlider(
                isDisabled: true,
                value: 40,
                onChanged: null,
              ),
              const SizedBox(height: 20),

              // Range Slider
              Container(
                padding: const EdgeInsets.all(20.0),
                width: 300,
                child: ZeroRangeSlider(
                  values: value3,
                  onChanged: _onChangeValue3,
                  size: ZeroSliderSize.small,
                  isDisabled: false,
                  tickInterval: 25,
                ),
              ),
              const SizedBox(height: 20),
              ZeroRangeSlider(
                values: value3,
                onChanged: _onChangeValue3,
                showTicks: true,
                style: const ZeroSliderStyle(tickBehavior: true),
                tickInterval: 25,
              ),
              const SizedBox(height: 20),
              ZeroRangeSlider(
                values: value3,
                onChanged: _onChangeValue3,
                showTicks: true,
                style: const ZeroSliderStyle(tickBehavior: true),
                size: ZeroSliderSize.small,
              ),
              const SizedBox(height: 20),
              const ZeroRangeSlider(
                values: ZeroRangeValues(40, 80),
                onChanged: null,
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
