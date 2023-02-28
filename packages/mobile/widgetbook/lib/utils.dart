import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

enum BuildMode { child, builder }

class PreviewWidget extends StatelessWidget {
  const PreviewWidget(
      {super.key,
      this.child,
      this.theme,
      this.builder,
      this.buildMode = BuildMode.child});

  factory PreviewWidget.builder(
          {ZeroThemeData? theme,
          required Widget Function(BuildContext context) builder}) =>
      PreviewWidget(
        theme: theme,
        builder: builder,
        buildMode: BuildMode.builder,
      );

  final Widget? child;
  final ZeroThemeData? theme;
  final Widget Function(BuildContext context)? builder;
  final BuildMode buildMode;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      theme: theme,
      home: Scaffold(
        body: Center(
          child: ZeroWidget(
            builder: builder,
            child: child,
          ),
        ),
      ),
    );
  }
}

class ZeroWidget extends StatelessWidget {
  final Widget? child;
  final Widget Function(BuildContext context)? builder;

  const ZeroWidget({super.key, this.child, this.builder});

  @override
  Widget build(BuildContext context) {
    return child ?? builder?.call(context) ?? const SizedBox.shrink();
  }
}
