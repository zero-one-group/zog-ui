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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ZeroTooltip(
                    position: ZeroTooltipPosition.right,
                    variant: ZeroTooltipVariant.rounded,
                    text: '0',
                    child: const Text('Show tooltip'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
