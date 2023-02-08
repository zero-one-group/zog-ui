import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroAlertDialog {
  ZeroAlertDialog._();
  static final ZeroAlertDialog _instance = ZeroAlertDialog._();
  factory ZeroAlertDialog() => _instance;
  OverlayEntry? _overlayEntry;

  void show(
    BuildContext context, {
    required String title,
    required String content,
    bool barrierDismissible = false,
    Color barrierColor = Colors.black54,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    List<Widget> actions = const [],
    MainAxisAlignment actionsAlignment = MainAxisAlignment.end,
    Image? image,
    List<Widget> listItem = const [],
  }) {
    if (_overlayEntry != null) return;
    _overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          GestureDetector(
            onTap: () => barrierDismissible ? hide() : {},
            child: Container(
              color: barrierColor,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: _ZeroAlertDialogContent(
                  title: title,
                  content: content,
                  titleStyle: titleStyle,
                  contentStyle: contentStyle,
                  actions: actions,
                  actionsAlignment: actionsAlignment,
                  image: image,
                  listItem: listItem,
                ),
              ),
            ),
          ),
        ],
      );
    });
    Overlay.of(context, rootOverlay: false).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _ZeroAlertDialogContent extends StatelessWidget {
  final String title;
  final String content;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final List<Widget> actions;
  final Image? image;
  final MainAxisAlignment actionsAlignment;
  final List<Widget> listItem;
  const _ZeroAlertDialogContent({
    required this.title,
    required this.content,
    this.titleStyle,
    this.contentStyle,
    required this.actions,
    required this.actionsAlignment,
    required this.listItem,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null)
            SizedBox(
              height: 100,
              width: 300,
              child: image,
            ),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle?.merge(context.theme.typography.heading5 ?? const TextStyle()) ?? const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            content,
            style: contentStyle?.merge(context.theme.typography.body2 ?? const TextStyle()) ?? const TextStyle(fontSize: 14),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [const SizedBox(height: 10), ...listItem],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: actionsAlignment,
            children: actions,
          )
        ],
      ),
    );
  }
}
