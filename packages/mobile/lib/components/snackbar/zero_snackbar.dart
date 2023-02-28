import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// A custom snackbar that can be used to display a message to the user.
/// [ZeroSnackbar] have 2 types of snackbar, [ZeroSnackbarType.singleline] and [ZeroSnackbarType.multiline].
/// [ZeroSnackbarType.singleline] is a snackbar that can only display a single line of text for short messages.
/// [ZeroSnackbarType.multiline] is a snackbar that can display multiple lines of text for longer messages.
class ZeroSnackbar {
  ZeroSnackbar._();
  static final ZeroSnackbar _instance = ZeroSnackbar._();
  factory ZeroSnackbar() => _instance;
  OverlayEntry? _overlayEntry;

  /// [show] is a function that displays a snackbar.
  void show(
    BuildContext context,

    /// [message] is the message that will be displayed in the snackbar.
    String message, {
    /// [type] is the type of snackbar that will be displayed, [ZeroSnackbarType.singleline] or [ZeroSnackbarType.multiline]
    ZeroSnackbarType type = ZeroSnackbarType.singleline,

    /// [duration] is the duration that the snackbar will be displayed, if duration is zero, the snackbar will not be dismissed automatically.
    Duration? duration,

    /// [closeButton] is a boolean that determines if the snackbar will have a close button, this is a close icon where appears on the bottom right corner of the snackbar.
    bool closeButton = true,

    /// [actionButton] is a boolean that determines if the snackbar will have an action button, this is a button that appears on the bottom right corner of the snackbar.
    bool actionButton = false,

    /// [actionText] is the text that will be displayed on the [actionButton].
    String? actionText,

    /// [actionOnPressed] is the callback function that will be called when the [actionButton] is pressed.
    VoidCallback? actionOnPressed,

    /// [onClose] is the callback function that will be called when the [closeButton] pressed.
    VoidCallback? onClose,

    /// [backgroundColor] is the background color of the snackbar.
    Color? backgroundColor,

    /// [actionButtonTextColor] is the text color of the [actionButton].
    Color? actionButtonTextColor,

    /// [closeIconColor] is the color of the [closeButton].
    Color? closeIconColor,

    /// [textStyle] is the text style of the message.
    TextStyle? textStyle,

    /// [position] is the position of the snackbar, [SnackbarPosition.bottom], [SnackbarPosition.top], or [SnackbarPosition.center].
    SnackbarPosition position = SnackbarPosition.bottom,
  }) {
    /// If the snackbar is already displayed, then the snackbar will not be displayed again.
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(builder: (context) {
      return SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Align(
              alignment: position.alignment,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: backgroundColor ??
                          context.theme.scaffoldBackgroundColor,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                message,
                                style: textStyle,
                              ),
                            ),
                            if (type == ZeroSnackbarType.singleline)
                              Row(
                                children: [
                                  _actionButton(
                                      actionButton,
                                      actionText,
                                      actionOnPressed,
                                      actionButtonTextColor ??
                                          context.theme.primaryColor),
                                  _closeButton(
                                      closeButton,
                                      onClose,
                                      closeIconColor ??
                                          context.theme.solidTextColor),
                                ],
                              ),
                          ],
                        ),
                        if (type == ZeroSnackbarType.multiline)
                          const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (type == ZeroSnackbarType.multiline)
                              Row(
                                children: [
                                  _actionButton(
                                      actionButton,
                                      actionText,
                                      actionOnPressed,
                                      actionButtonTextColor ??
                                          context.theme.primaryColor),
                                  _closeButton(
                                      closeButton,
                                      onClose,
                                      closeIconColor ??
                                          context.theme.solidTextColor),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
    Overlay.of(context, rootOverlay: false).insert(_overlayEntry!);

    /// hide the alert after the duration
    /// if the duration is zero, the alert will be permanent
    /// if the duration is null, the alert will be displayed for 2 seconds
    duration == Duration.zero
        ? null
        : Future.delayed(duration ?? const Duration(seconds: 2), () {
            hide();
          });
  }

  Widget _actionButton(
    bool actionButton,
    String? actionText,
    VoidCallback? actionOnPressed,
    Color buttonTextColor,
  ) {
    if (actionButton) {
      return Builder(builder: (context) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: actionOnPressed,
            child: Text(
              actionText ?? '',
              style: TextStyle(color: buttonTextColor),
            ),
          ),
        );
      });
    } else {
      return const SizedBox();
    }
  }

  /// [closeButton] is a boolean that determines if the snackbar will have a close button, this is a close icon where appears on the bottom right corner of the snackbar.
  Widget _closeButton(
      bool closeButton, VoidCallback? onClose, Color iconColor) {
    if (closeButton) {
      return Container(
        margin: const EdgeInsets.only(left: 14),
        child: InkWell(
          onTap: () {
            hide();
            onClose?.call();
          },
          child: Icon(
            Icons.close,
            size: 16,
            color: iconColor,
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  /// [hide] hides the snackbar by removing the overlay entry.
  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
