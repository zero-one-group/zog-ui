import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

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

            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/500',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 4,
            //   mainAxisCount: 6,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/501',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 3,
            //   mainAxisCount: 3,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/502',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 3,
            //   mainAxisCount: 3,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/503',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 3,
            //   mainAxisCount: 2,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/504',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 3,
            //   mainAxisCount: 2,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/505',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 4,
            //   mainAxisCount: 2,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/505',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 3,
            //   mainAxisCount: 4,
            // ),
            // ZeroGridItem(
            //   child: Image.network(
            //     'https://picsum.photos/506',
            //     fit: BoxFit.cover,
            //   ),
            //   crossAxisCount: 6,
            //   mainAxisCount: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
