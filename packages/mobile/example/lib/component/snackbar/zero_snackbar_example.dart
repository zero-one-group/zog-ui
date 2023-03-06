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
                ZeroButton.text(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.danger,
                    );
                  },
                  child: const Text('Show SnackbarAlert Danger'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.warning,
                    );
                  },
                  child: const Text('Show SnackbarAlert Warning'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.info,
                    );
                  },
                  child: const Text('Show SnackbarAlert Info'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.success,
                    );
                  },
                  child: const Text('Show SnackbarAlert Success'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
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
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.filled,
                      action: _alertAction(),
                    );
                  },
                  child: const Text('Show SnackbarAlert with Action'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.solidFilled,
                      action: _alertAction(),
                      position: SnackbarPosition.top,
                    );
                  },
                  child: const Text('Show SnackbarAlert with Top Position'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.solidFilled,
                      action: _alertAction(),
                      position: SnackbarPosition.center,
                    );
                  },
                  child: const Text('Show SnackbarAlert with Center Position'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbarAlert().show(
                      context,
                      title: 'This is a snackbar',
                      subtitle: 'This is subtitle of snackbar',
                      variant: ZeroSnackbarAlertVariant.success,
                      type: ZeroSnackbarAlertType.filled,
                      action: _alertAction(),
                      position: SnackbarPosition.center,
                      style: ZeroSnackbarAlertStyle(
                        border: const BorderSide(color: Colors.green, width: 5),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple,
                      ),
                    );
                  },
                  child: const Text('Show SnackbarAlert Custom'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbar().show(
                      context,
                      'This is a snackbar',
                      type: ZeroSnackbarType.singleline,
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
                TextButton(
                  onPressed: () {
                    ZeroSnackbar().show(
                      context,
                      'Two-line snackbar with longer action and close affordance',
                      type: ZeroSnackbarType.multiline,
                      closeButton: true,
                      actionButton: true,
                      actionText: 'Action',
                      actionOnPressed: () {
                        log('onClose');
                      },
                    );
                  },
                  child: const Text('Show Snackbar Multiline'),
                ),
                TextButton(
                  onPressed: () {
                    ZeroSnackbar().show(
                      context,
                      'Two-line snackbar with longer action and close affordance',
                      type: ZeroSnackbarType.multiline,
                      closeButton: true,
                      actionButton: true,
                      actionText: 'Action',
                      actionOnPressed: () {
                        log('onClose');
                      },
                      style: ZeroSnackbarStyle(
                        border: const BorderSide(color: Colors.pink),
                        textStyle: const TextStyle(color: Colors.green),
                        elevation: 2,
                        closeIcon: const Icon(ZeroIcons.book),
                        actionStyle: const TextStyle(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                  child: const Text('Show Snackbar Custom'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _alertAction() {
    return SizedBox(
      height: 24,
      child: IconButton(
        onPressed: () {
          ZeroSnackbarAlert().hide();
        },
        icon: const Icon(Icons.close),
        color: Colors.white,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
