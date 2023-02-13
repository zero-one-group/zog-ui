import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:zero_ui_mobile/zero_ui_mobile.dart';

const Size _calendarPortraitDialogSize = Size(330.0, 330.0);
const Size _calendarLandscapeDialogSize = Size(496.0, 346.0);

const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);

class ZeroDatePickerTextField extends StatefulWidget {
  final InputDecorationType inputDecorationType;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;

  final String? confirmText;
  final String? cancelText;

  final Icon? suffixIcon;

  const ZeroDatePickerTextField(
      {Key? key,
      this.inputDecorationType = InputDecorationType.outline,
      required this.initialDate,
      required this.firstDate,
      required this.lastDate,
      this.labelText,
      this.hintText,
      this.helperText,
      this.errorText,
      this.cancelText,
      this.confirmText,
      this.suffixIcon})
      : super(key: key);

  @override
  State<ZeroDatePickerTextField> createState() =>
      _ZeroDatePickerTextFieldState();
}

class _ZeroDatePickerTextFieldState extends State<ZeroDatePickerTextField>
    with TickerProviderStateMixin {
  // focus node object to detect gained or loss on textField
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  GlobalKey globalKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    OverlayState? overlayState = Overlay.of(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      globalKey;
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();

        overlayState.insert(_overlayEntry!);
      }
    });
  }

  void _handleOk() {
    // Navigator.pop(context, _selectedDate.value);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;

    final theme = context.theme.toThemeData();
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final Orientation orientation = MediaQuery.of(context).orientation;
    final double textScaleFactor =
        math.min(MediaQuery.of(context).textScaleFactor, 1.3);

    final Size dialogSize = _dialogSize(context) * textScaleFactor;

    final Widget actions = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minHeight: 52.0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OverflowBar(
        spacing: 8,
        overflowAlignment: OverflowBarAlignment.center,
        children: <Widget>[
          TextButton(
            style: context.theme.textButtonStyle.toButtonStyle(),
            onPressed: _handleCancel,
            child: Text(widget.cancelText ??
                (theme.useMaterial3
                    ? localizations.cancelButtonLabel
                    : localizations.cancelButtonLabel.toUpperCase())),
          ),
          TextButton(
            style: context.theme.textButtonStyle.toButtonStyle(),
            onPressed: _handleOk,
            child: Text(widget.confirmText ?? localizations.okButtonLabel),
          ),
        ],
      ),
    );

    final picker = Theme(
      data: context.theme.copyWith(useMaterial3: true).toThemeData(),
      child: ZeroCalendarDatePicker(
          onDateChanged: (value) {},
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          initialDate: widget.initialDate),
    );

    var size = renderBox.size;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: AnimatedContainer(
                  width: dialogSize.width,
                  height: dialogSize.height,
                  duration: _dialogSizeAnimationDuration,
                  curve: Curves.easeIn,
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: textScaleFactor,
                    ),
                    child: Builder(builder: (BuildContext context) {
                      switch (orientation) {
                        case Orientation.portrait:
                          return Material(
                              child: Card(
                            shape:
                                context.theme.toThemeData().dialogTheme.shape,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ZeroDivider.horizontal(
                                  variant: ZeroDividerVariant.fullWidth,
                                  style: ZeroDividerStyle(
                                      color: ZeroColors.neutral[5]),
                                ),
                                Expanded(child: picker),
                                actions,
                              ],
                            ),
                          ));
                        case Orientation.landscape:
                          return Material(
                              child: Card(
                                  shape: context.theme
                                      .toThemeData()
                                      .dialogTheme
                                      .shape,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Expanded(child: picker),
                                            actions,
                                          ],
                                        ),
                                      ),
                                    ],
                                  )));
                      }
                    }),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Theme(
        data: context.theme
            .copyWith(
              inputDecorationType: widget.inputDecorationType,
            )
            .toThemeData(),
        child: DropdownButtonHideUnderline(
          child: TextFormField(
            focusNode: _focusNode,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              helperText: widget.helperText,
              hintText: widget.hintText,
              labelText: widget.labelText,
              suffixIcon: widget.suffixIcon ?? const Icon(Icons.calendar_month),
            ),
          ),
        ),
      ),
    );
  }
}

Size _dialogSize(BuildContext context) {
  final Orientation orientation = MediaQuery.of(context).orientation;

  switch (orientation) {
    case Orientation.portrait:
      return _calendarPortraitDialogSize;
    case Orientation.landscape:
      return _calendarLandscapeDialogSize;
  }
}
