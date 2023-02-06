import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'solid_example.dart';
import 'two_tone_example.dart';

class ZeroIconExample extends StatelessWidget {
  const ZeroIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Icon Example'),
      ),
      body: ListView(
        children: [
          ZeroListTile(
            title: 'Two Tone',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const IconsTwoToneExample()),
              );
            },
          ),
          ZeroListTile(
            title: 'Solid',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const IconsSolidExample()),
              );
            },
          )
        ],
      ),
    );
  }
}
