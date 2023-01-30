import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

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
            children: [
              ZeroTooltip(
                position: ZeroTooltipPosition.right,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: const Text('Show tooltip on the right'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.top,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: const Text('Show tooltip on the top'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.left,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: const Text('Show tooltip on the left'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.custom,
                text: 'tooltip text',
                child: const Text('Show tooltip on the bottom'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rectangle,
                text: 'tooltip text',
                child: const Text('Show tooltip rectangle variant'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rounded,
                text: '99',
                child: const Text('Show tooltip rounded variant'),
              ),
              const SizedBox(height: 40),
              ZeroTooltip(
                position: ZeroTooltipPosition.bottom,
                variant: ZeroTooltipVariant.rounded,
                type: ZeroTooltipType.light,
                text: '99',
                child: const Text('Show tooltip light type'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
