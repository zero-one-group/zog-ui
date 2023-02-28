import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroGridExample extends StatefulWidget {
  const ZeroGridExample({super.key});

  @override
  State<ZeroGridExample> createState() => _ZeroGridExampleState();
}

class _ZeroGridExampleState extends State<ZeroGridExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Grid Example'),
      ),
      body: SingleChildScrollView(
        child: ZeroGrid(
          padding: const EdgeInsets.all(8.0),
          columnCount: 6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            ZeroGridItem(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              mainAxisCount: 4,
              crossAxisCount: 4,
            ),
            ...List.generate(
              14,
              (index) => ZeroGridItem(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
