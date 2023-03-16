import 'dart:math' as math;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:zog_ui/zog_ui.dart';

const Size _calendarPortraitDialogSize = Size(328.0, 420.0);
const Size _calendarLandscapeDialogSize = Size(496.0, 346.0);

const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);

/// A [TextFormField] displaying a grid of days for a given month and allows the user to select a
/// in docked mode
///
/// Days are arranged in a rectangular grid with one column for each day of the
/// week. Controls are provided to change the year and month that the grid is
/// showing.
///
/// The docked would displayed every time the [TextFormField] has focus. And it will be dismissed every time
/// the user tap OK or Cancel button, or tapping on the [TextFormField] when the docked is open.
///
/// See also:
///
///  * [showZeroDatePicker], which creates a Dialog that contains a
///    [ZeroDockedCalendarDatePicker] and provides an optional compact view where the
///    user can enter a date as a line of text.
///
class ZeroDatePickerDocked extends StatefulWidget {
  /// Values: [inputDecorationType.outline], [inputDecorationType.underline], and [inputDecorationType.fill]
  /// This affects how the widget renders [OutlineInputBorder] in terms of fill color, border colors, and fill color
  final InputDecorationType inputDecorationType;

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;

  /// A confirm text after user selects the date.
  /// It defaults to [localizations.okButtonLabel] if not set
  final String? confirmText;

  /// A cancel text after user selects the date.
  /// It defaults to [localizations.cancelButtonLabel] if not set.
  final String? cancelText;

  /// Suffix icon on the [TextFormField]. It defaults to [Icons.calendar_month] if not set
  final Icon? suffixIcon;

  /// Called when the user selects a date in the picker.
  final ValueChanged<DateTime> onDateChanged;

  /// Defines the visual properties of the widget displayed with [showZeroDatePicker].
  ///
  /// Descendant widgets obtain the current [ZeroDatePickerStyle] object using
  /// `context.theme.datePickerStyle`. Instances of [ZeroDatePickerStyle]
  /// can be customized with [ZeroDatePickerStyle.copyWith].
  ///
  /// Typically a [ZeroDatePickerStyle] is specified as part of the overall
  /// [ZeroTheme] with [ZeroThemeData.datePickerTheme].
  ///
  /// All [ZeroDatePickerStyle] properties are `null` by default. When null,
  /// [showZeroDatePicker] will provide its own defaults.
  final ZeroDatePickerStyle? style;

  const ZeroDatePickerDocked({
    Key? key,
    this.inputDecorationType = InputDecorationType.outline,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.cancelText,
    this.confirmText,
    this.suffixIcon,
    this.style,
  }) : super(key: key);

  @override
  State<ZeroDatePickerDocked> createState() => _ZeroDatePickerDockedState();
}

class _ZeroDatePickerDockedState extends State<ZeroDatePickerDocked>
    with TickerProviderStateMixin {
  // focus node object to detect gained or loss on textField
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();

  final TextEditingController _textEditingController = TextEditingController();
  final DateFormat _dateFormat =
      DateFormat.d().addPattern('/').add_M().addPattern('/').add_y();

  OverlayEntry? _overlayEntry;

  bool _showActions = true;

  /// Selected date provided by [ZeroDockedCalendarDatePicker]
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    OverlayState? overlayState = Overlay.of(context);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlay();
        overlayState.insert(_overlayEntry!);
      }
    });
  }

  void _handleOk() {
    _overlayEntry?.remove();
    _focusNode.nextFocus();

    if (_selectedDate == null) return;

    widget.onDateChanged.call(_selectedDate!);
  }

  void _handleCancel() {
    _overlayEntry?.remove();
  }

  OverlayEntry _createOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;

    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);

    final Orientation orientation =
        kIsWeb ? Orientation.portrait : MediaQuery.of(context).orientation;
    final double textScaleFactor =
        math.min(MediaQuery.of(context).textScaleFactor, 1.3);

    final Size dialogSize = _dialogSize(context) * textScaleFactor;

    final adaptiveStyle = context.theme.datePickerStyle.merge(widget.style);

    final Widget actions = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minHeight: 52.0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OverflowBar(
        spacing: 8,
        overflowAlignment: OverflowBarAlignment.center,
        children: <Widget>[
          ZeroButton.text(
            style: context.theme.textButtonStyle,
            onPressed: _handleCancel,
            child: Text(widget.cancelText ?? localizations.cancelButtonLabel),
          ),
          ZeroButton.text(
            style: context.theme.textButtonStyle,
            onPressed: _handleOk,
            child: Text(widget.confirmText ?? localizations.okButtonLabel),
          ),
        ],
      ),
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
                    child: StatefulBuilder(
                        builder: (BuildContext context, innerState) {
                      switch (orientation) {
                        case Orientation.portrait:
                          return _buildPotrait(
                              context, adaptiveStyle, innerState, actions);

                        case Orientation.landscape:
                          return _buildLandscape(
                              context, adaptiveStyle, innerState, actions);
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
              textfieldStyleSet: ZeroTextfieldStyleSet.fallback(
                  defaultDecorationType: widget.inputDecorationType,
                  textfieldSize: ZeroTextfieldSize.small,
                  focusedBorderColor: context.theme.primaryColor,
                  focusedColor: context.theme.primaryColor),
            )
            .toThemeData(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: TextFormField(
            focusNode: _focusNode,
            controller: _textEditingController,
            keyboardType: TextInputType.text,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            readOnly: true,
            decoration: InputDecoration(
              helperText: widget.helperText ??
                  'DD/MM/YY', // TODO: hardcoded, make localizations
              hintText: widget.hintText,
              labelText: widget.labelText,
              suffixIcon: widget.suffixIcon ?? const Icon(Icons.calendar_month),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPotrait(BuildContext context, ZeroDatePickerStyle adaptiveStyle,
      StateSetter innerState, Widget actions) {
    return Material(
        child: Card(
      color: adaptiveStyle.pickerBackgroundColor,
      shape:
          adaptiveStyle.shape ?? context.theme.toThemeData().dialogTheme.shape,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ZeroDockedCalendarDatePicker(
              onDateChanged: (value) {
                _textEditingController.text = _dateFormat.format(value);
                _selectedDate = value;
              },
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
              initialDate: _selectedDate ?? widget.initialDate,
              onModeChanged: (mode) {
                innerState(() {
                  _showActions = mode == ZeroDatePickerMode.day;
                });
              },
              style: widget.style?.calendarStyle,
            ),
          ),
          if (_showActions) actions,
        ],
      ),
    ));
  }

  Widget _buildLandscape(
      BuildContext context,
      ZeroDatePickerStyle adaptiveStyle,
      StateSetter innerState,
      Widget actions) {
    return Material(
        child: Card(
      color: adaptiveStyle.pickerBackgroundColor,
      shape:
          adaptiveStyle.shape ?? context.theme.toThemeData().dialogTheme.shape,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: ZeroDockedCalendarDatePicker(
                  onDateChanged: (value) {
                    _textEditingController.text = _dateFormat.format(value);
                    _selectedDate = value;
                  },
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate,
                  initialDate: widget.initialDate,
                  onModeChanged: (mode) {
                    innerState(() {
                      _showActions = mode == ZeroDatePickerMode.day;
                    });
                  })),
          if (_showActions) actions,
        ],
      ),
    ));
  }
}

Size _dialogSize(BuildContext context) {
  final Orientation orientation =
      kIsWeb ? Orientation.portrait : MediaQuery.of(context).orientation;

  switch (orientation) {
    case Orientation.portrait:
      return _calendarPortraitDialogSize;
    case Orientation.landscape:
      return _calendarLandscapeDialogSize;
  }
}
