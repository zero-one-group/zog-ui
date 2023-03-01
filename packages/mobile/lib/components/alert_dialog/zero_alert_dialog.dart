import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAlertDialog {
  /// private construnctor to make this a singleton class
  ZeroAlertDialog._();
  static final ZeroAlertDialog _instance = ZeroAlertDialog._();
  factory ZeroAlertDialog() => _instance;

  /// The overlay entry that will be used to show the dialog
  OverlayEntry? _overlayEntry;

  /// method to show the dialog
  void show(
    BuildContext context, {
    /// title of the dialog
    Widget? title,

    /// content of the dialog
    Widget? content,

    /// icon of the dialog
    /// positioned at the top of the dialog
    Icon? icon,
    ZeroAlertDialogStyle? style,

    /// if the dialog is dismissible by tapping outside the dialog
    /// default is true
    bool barrierDismissible = true,

    /// actions of the dialog (buttons)
    List<Widget> actions = const [],

    /// alignment of the actions
    /// default is MainAxisAlignment.end
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,
  }) {
    /// if the dialog is already shown, return
    if (_overlayEntry != null) return;

    /// create the overlay entry
    _overlayEntry = OverlayEntry(builder: (context) {
      /// merge the style with the theme style
      final themeStyle = context.theme.alertDialogStyle;
      final adaptiveStyle = themeStyle.merge(style);

      /// barrier widget that will be shown behind the dialog
      /// if the dialog is dismissible, it will call the hide method
      /// if the dialog is not dismissible, it will do nothing
      Widget barrier() {
        return GestureDetector(
          onTap: () => barrierDismissible ? hide() : {},
          child: Container(
            color: adaptiveStyle.barrierColor,
            height: double.infinity,
            width: double.infinity,
          ),
        );
      }

      return Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          barrier(),
          AlertDialog(
            title: title,
            content: content,
            actions: actions,
            titlePadding: adaptiveStyle.titlePadding,
            contentPadding: adaptiveStyle.contentPadding,
            actionsAlignment: actionsAlignment,
            shadowColor: adaptiveStyle.shadowColor,
            icon: icon,
            iconColor: adaptiveStyle.iconColor,
            iconPadding: adaptiveStyle.iconPadding,
            alignment: adaptiveStyle.alignment,
            backgroundColor: adaptiveStyle.backgroundColor,
            actionsPadding: adaptiveStyle.actionsPadding,
            elevation: adaptiveStyle.elevation,
            shape: adaptiveStyle.shape,
            titleTextStyle: adaptiveStyle.titleTextStyle,
            contentTextStyle: adaptiveStyle.contentTextStyle,
          ),
        ],
      );
    });
    Overlay.of(context, rootOverlay: false).insert(_overlayEntry!);
  }

  /// method to hide the dialog
  /// this will remove the overlay entry
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
