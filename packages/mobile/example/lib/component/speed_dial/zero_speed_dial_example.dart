import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroSpeedDialExample extends StatelessWidget {
  const ZeroSpeedDialExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero Speed Dial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZeroButton.primary(
              child: const Text('Speed Dial End Top Horizontal'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.endTop,
                      direction: ZeroSpeedDialDirection.horizontal,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial End Bottom Horizontal'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.endFloat,
                      direction: ZeroSpeedDialDirection.horizontal,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial Start Top Horizontal'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.startTop,
                      direction: ZeroSpeedDialDirection.horizontal,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial Start Bottom Horizontal'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.startFloat,
                      direction: ZeroSpeedDialDirection.horizontal,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial End Top Vertical'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.endTop,
                      direction: ZeroSpeedDialDirection.vertical,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial End Bottom Vertical'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.endFloat,
                      direction: ZeroSpeedDialDirection.vertical,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial Start Top Vertical'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.startTop,
                      direction: ZeroSpeedDialDirection.vertical,
                    ),
                  ),
                );
              },
            ),
            ZeroButton.primary(
              child: const Text('Speed Dial Start Bottom Vertical'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const _ZeroSpeedDialEndTopExample(
                      position: FloatingActionButtonLocation.startFloat,
                      direction: ZeroSpeedDialDirection.vertical,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ZeroSpeedDialEndTopExample extends StatefulWidget {
  final FloatingActionButtonLocation position;
  final ZeroSpeedDialDirection direction;
  const _ZeroSpeedDialEndTopExample({
    required this.position,
    required this.direction,
  });

  @override
  State<_ZeroSpeedDialEndTopExample> createState() =>
      __ZeroSpeedDialEndTopExampleState();
}

class __ZeroSpeedDialEndTopExampleState
    extends State<_ZeroSpeedDialEndTopExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Speed Dial Example'),
      ),
      floatingActionButton: ZeroSpeedDial(
        style: const ZeroSpeedDialStyle(
          inactiveColor: Colors.green,
          activeColor: Colors.purple,
          size: 50,
          spacing: 12,
          elevation: 2,
        ),
        label: const Text('Label'),
        direction: widget.direction,
        activeChild: const Center(child: Icon(Icons.close)),
        inactiveChild: const Icon(Icons.add),
        tooltipVariant: ZeroTooltipVariant.custom,
        children: [
          ZeroSpeedDialItem(
            tooltipText: const Text('Tooltip Text'),
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
            onTap: () {
              log('Hello');
            },
          ),
          ZeroSpeedDialItem(
            backgroundColor: Colors.red,
            child: const Icon(Icons.add),
            onTap: () {
              log('Hello');
            },
          ),
          const ZeroSpeedDialItem(
            tooltipText: Text('Add', style: TextStyle(color: Colors.green)),
            child: Text('data'),
          )
        ],
      ),
      floatingActionButtonLocation: widget.position,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.grey,
        ),
      ),
    );
  }
}
