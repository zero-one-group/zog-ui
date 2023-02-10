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
                  elevation: 4,
                  content:
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                  image: Image.network(
                    'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  titlePadding: const EdgeInsets.all(4),
                  contentPadding: const EdgeInsets.all(4),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  // backgroundColor: Colors.black,
                  barrierDismissible: false,
                  alignment: Alignment.centerRight,
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    TextButton(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      child: const Text('Cancel'),
                    ),
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
            TextButton(
              onPressed: () {
                ZeroAlertDialog().show(
                  context,
                  title: 'Title',
                  content:
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                );
              },
              child: const Text('Show Simple Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
