import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

import 'items.dart';
import 'pages/card_page.dart';
import 'pages/list_tile_page.dart';

class ZeroSkeletonExample extends StatelessWidget {
  const ZeroSkeletonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ZeroButton.primary(
                child: const Text('Items'),
                onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                    builder: (context) => const ItemsExamplePage()))),
              ),
              ZeroButton.primary(
                child: const Text('List Tiles'),
                onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                    builder: (context) => const ListTileExamplePage()))),
              ),
              ZeroButton.primary(
                child: const Text('Cards'),
                onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                    builder: (context) => const CardsExamplePage()))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
