import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroTooltipExample extends StatefulWidget {
  const ZeroTooltipExample({super.key});

  @override
  State<ZeroTooltipExample> createState() => _ZeroTooltipExampleState();
}

class _ZeroTooltipExampleState extends State<ZeroTooltipExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Tooltip Example'),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ZeroTooltip(
                position: ZeroTooltipPosition.right,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: Text('Show tooltip on the right'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.top,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: Text('Show tooltip on the top'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.left,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: Text('Show tooltip on the left'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: Text('Show tooltip on the bottom'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rectangle,
                text: 'tooltip text',
                child: Text('Show tooltip rectangle variant'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rounded,
                text: '99',
                child: Text('Show tooltip rounded variant'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rounded,
                brightness: Brightness.light,
                text: '99',
                child: Text('Show tooltip light type'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rounded,
                brightness: Brightness.dark,
                text: '99',
                child: Text('Show tooltip dark type'),
              ),
              SizedBox(height: 40),
              ZeroTooltip(
                text: 'Custom',
                variant: ZeroTooltipVariant.custom,
                style: ZeroTooltipStyle(
                  backgroundColor: Colors.pink,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  borderColor: Colors.green,
                ),
                child: Text('Show tooltip custom'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
