import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroAlertDialogExample extends StatefulWidget {
  const ZeroAlertDialogExample({super.key});

  @override
  State<ZeroAlertDialogExample> createState() => _ZeroAlertDialogExampleState();
}

class _ZeroAlertDialogExampleState extends State<ZeroAlertDialogExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Alert Dialog Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ZeroAlertDialog().show(
                  context,
                  title: 'Basic dialog title',
                  content:
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                  image: Image.network(
                    'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
                    fit: BoxFit.cover,
                  ),
                  titleStyle: TextStyle(color: Colors.red),
                  contentStyle: TextStyle(color: Colors.blue),
                  barrierDismissible: false,
                  actionsAlignment: MainAxisAlignment.start,
                  listItem: [
                    ZeroListTile(
                      title: 'List Tile 1',
                      style: const ZeroListTileStyle(
                        contentPadding: EdgeInsets.all(0),
                        smallContentPadding: EdgeInsets.all(0),
                      ),
                      leftIcon: const Icon(Icons.person),
                      rightIcon: ZeroCheckbox(value: true, tristate: true, onChanged: (val) {}),
                      onTap: () {},
                    ),
                    ZeroListTile(
                      title: 'List Tile 2',
                      style: const ZeroListTileStyle(
                        contentPadding: EdgeInsets.all(0),
                        smallContentPadding: EdgeInsets.all(0),
                      ),
                      leftIcon: const Icon(Icons.person),
                      rightIcon: ZeroCheckbox(value: true, tristate: true, onChanged: (val) {}),
                      onTap: () {},
                    ),
                    ZeroListTile(
                      title: 'List Tile 3',
                      style: const ZeroListTileStyle(
                        contentPadding: EdgeInsets.all(0),
                        smallContentPadding: EdgeInsets.all(0),
                      ),
                      leftIcon: const Icon(Icons.person),
                      rightIcon: ZeroCheckbox(value: true, tristate: true, onChanged: (val) {}),
                      onTap: () {},
                    ),
                  ],
                  actions: [
                    TextButton(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
              child: const Text('Show Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
