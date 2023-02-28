import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroDividerExample extends StatelessWidget {
  const ZeroDividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Divider Example'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: const [
              SizedBox(height: 32),
              Text('Default'),
              ZeroDivider(),
              SizedBox(height: 20),
              Text('Inset'),
              ZeroDivider.horizontal(variant: ZeroDividerVariant.inset),
              SizedBox(height: 20),
              Text('Middle Inset'),
              ZeroDivider.horizontal(variant: ZeroDividerVariant.middleInset),
              SizedBox(height: 20),
              Text('Custom'),
              ZeroDivider.horizontal(
                variant: ZeroDividerVariant.middleInset,
                style: ZeroDividerStyle(
                  color: Colors.blue,
                  size: 2,
                  endInset: 30,
                  startInset: 20,
                ),
              ),
            ],
          )),
          Container(
            color: Colors.red,
            height: 20,
            width: double.infinity,
            child: const Center(
              child: Text(
                'BARRIER',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: const [
              SizedBox(width: 32),
              Text('Default'),
              ZeroDivider.vertical(),
              SizedBox(width: 20),
              Text('Inset'),
              ZeroDivider.vertical(variant: ZeroDividerVariant.inset),
              SizedBox(width: 20),
              Text('Middle Inset'),
              ZeroDivider.vertical(variant: ZeroDividerVariant.middleInset),
              SizedBox(width: 20),
              Text('Custom'),
              ZeroDivider.vertical(
                variant: ZeroDividerVariant.middleInset,
                style: ZeroDividerStyle(
                  color: Colors.blue,
                  size: 2,
                  endInset: 30,
                  startInset: 20,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
