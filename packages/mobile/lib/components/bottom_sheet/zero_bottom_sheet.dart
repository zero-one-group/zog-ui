import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent({
    required this.style,
    required this.content,
    this.handleBar,
  });

  final ZeroBottomSheetStyle style;
  final Widget content;
  final Widget? handleBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        if (handleBar != null)
          handleBar!
        else if (style.useHandle == true)
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: style.handleColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}

Future<T?> showZeroModalBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  ZeroBottomSheetStyle? style,
  Widget? handleBar,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool useSafeArea = false,
}) async {
  final adaptiveStyle = context.theme.bottomSheetStyle.merge(style);

  return showModalBottomSheet(
    context: context,
    barrierColor: adaptiveStyle.barierColor,
    enableDrag: enableDrag,
    isDismissible: isDismissible,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    isScrollControlled: isScrollControlled,
    backgroundColor: adaptiveStyle.backgroundColor,
    elevation: adaptiveStyle.elevation,
    shape: RoundedRectangleBorder(
      borderRadius: adaptiveStyle.borderRadius ?? BorderRadius.zero,
    ),
    builder: (context) {
      return _BottomSheetContent(
        style: adaptiveStyle,
        content: builder(context),
        handleBar: handleBar,
      );
    },
  );
}

Future<PersistentBottomSheetController<T>> showZeroBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  ZeroBottomSheetStyle? style,
  Widget? handleBar,
  bool enableDrag = true,
}) async {
  final adaptiveStyle = context.theme.bottomSheetStyle.merge(style);

  return showBottomSheet(
    context: context,
    enableDrag: enableDrag,
    backgroundColor: adaptiveStyle.backgroundColor,
    elevation: adaptiveStyle.elevation,
    shape: RoundedRectangleBorder(
      borderRadius: adaptiveStyle.borderRadius ?? BorderRadius.zero,
    ),
    builder: (context) {
      return _BottomSheetContent(
        style: adaptiveStyle,
        content: builder(context),
        handleBar: handleBar,
      );
    },
  );
}
