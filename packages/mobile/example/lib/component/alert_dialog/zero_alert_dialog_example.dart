import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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
            ZeroButton.primary(
              onPressed: () {
                ZeroAlertDialog().show(
                  context,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: ZeroAlertDialogStyle(
                    alignment: Alignment.centerRight,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    barrierColor: Colors.amber.withOpacity(0.2),
                  ),
                  content: const Text(
                    'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                    textAlign: TextAlign.start,
                  ),
                  barrierDismissible: true,
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ZeroButton.primary(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      text: 'Cancel',
                    ),
                    ZeroButton.primary(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      text: 'OK',
                    ),
                  ],
                );
              },
              text: 'Show Alert Dialog',
            ),
            const SizedBox(height: 16),
            ZeroButton.primary(
              onPressed: () {
                ZeroAlertDialog().show(
                  context,
                  title: const Text('Basic dialog title'),
                  content: const Text(
                    'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',
                  ),
                  actions: [
                    ZeroButton.primary(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      text: 'Cancel',
                    ),
                    ZeroButton.primary(
                      onPressed: () {
                        ZeroAlertDialog().hide();
                      },
                      text: 'OK',
                    ),
                  ],
                );
              },
              text: 'Show Simple Alert Dialog',
            ),
          ],
        ),
      ),
    );
  }
}
