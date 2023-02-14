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

                  title: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Basic dialog title'),
                    ],
                  ),
                  elevation: 4,
                  content: const Text(
                    'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                    textAlign: TextAlign.center,
                  ),
                  // backgroundColor: Colors.black,
                  shadowColor: Colors.amber,
                  barrierDismissible: false,
                  alignment: Alignment.centerRight,
                  actionsAlignment: MainAxisAlignment.center,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
                  title: const Text('Basic dialog title'),
                  content: const Text(
                    'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                  ),
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
              child: const Text('Show Simple Alert Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
