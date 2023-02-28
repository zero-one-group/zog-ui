import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroSnackbarExample extends StatefulWidget {
  const ZeroSnackbarExample({super.key});

  @override
  State<ZeroSnackbarExample> createState() => _ZeroSnackbarExampleState();
}

class _ZeroSnackbarExampleState extends State<ZeroSnackbarExample> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Snackbar Example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.danger,
                    );
                  },
                  child: const Text('Show SnackbarAlert Danger'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.danger,
                      type: ZeroSnackbarAlertType.outlined,
                    );
                  },
                  child: const Text('Show SnackbarAlert Danger Outlined'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.danger,
                      type: ZeroSnackbarAlertType.filled,
                    );
                  },
                  child: const Text('Show SnackbarAlert Danger Filled'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.warning,
                    );
                  },
                  child: const Text('Show SnackbarAlert Warning'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.warning,
                      type: ZeroSnackbarAlertType.outlined,
                    );
                  },
                  child: const Text('Show SnackbarAlert Warning Outlined'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.warning,
                      type: ZeroSnackbarAlertType.filled,
                    );
                  },
                  child: const Text('Show SnackbarAlert Warning Filled'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.info,
                    );
                  },
                  child: const Text('Show SnackbarAlert Info'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.info,
                      type: ZeroSnackbarAlertType.outlined,
                    );
                  },
                  child: const Text('Show SnackbarAlert Info Outlined'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.info,
                      type: ZeroSnackbarAlertType.filled,
                    );
                  },
                  child: const Text('Show SnackbarAlert Info Filled'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                    );
                  },
                  child: const Text('Show SnackbarAlert Success'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.outlined,
                    );
                  },
                  child: const Text('Show SnackbarAlert Success Outlined'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.filled,
                    );
                  },
                  child: const Text('Show SnackbarAlert Success Filled'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.filled,
                      actionWidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                    );
                  },
                  child: const Text('Show SnackbarAlert with Action'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.solidFilled,
                      actionWidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                      position: SnackbarPosition.top,
                    );
                  },
                  child: const Text('Show SnackbarAlert with Top Position'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'this is a snackbar',
                      subtitle: 'this is subtitle',
                      duration: const Duration(seconds: 1),
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.solidFilled,
                      actionWidget: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                      ),
                      position: SnackbarPosition.center,
                    );
                  },
                  child: const Text('Show SnackbarAlert with Center Position'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbar().show(
                      context,
                      'this is a snackbar',
                      duration: const Duration(seconds: 5),
                      type: ZeroSnackbarType.multiline,
                      closeButton: true,
                      actionButton: true,
                      actionText: 'Action',
                      actionOnPressed: () {
                        log('onClose');
                      },
                    );
                  },
                  child: const Text('Show Snackbar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
