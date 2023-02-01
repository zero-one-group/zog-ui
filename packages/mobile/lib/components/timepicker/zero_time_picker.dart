import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/styles/colors.dart';
import 'package:zero_ui_mobile/styles/component/zero_button_style.dart';
import 'package:zero_ui_mobile/styles/theme.dart';

class ZeroTimePickerDialog extends StatelessWidget {
  final TimeOfDay initialTime;

  const ZeroTimePickerDialog({
    super.key,
    BuildContext? context,
    required this.initialTime,
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    RouteSettings? routeSettings,
    EntryModeChangeCallback? onEntryModeChanged,
    Offset? anchorPoint,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: TimePickerDialog(initialTime: initialTime),
    );
  }
}

/// See also:
///
///  * [showDatePicker], which shows a dialog that contains a Material Design
///    date picker.
///  * [TimePickerThemeData], which allows you to customize the colors,
///    typography, and shape of the time picker.
///  * [DisplayFeatureSubScreen], which documents the specifics of how
///    [DisplayFeature]s can split the screen into sub-screens.
Future<TimeOfDay?> showZeroTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  TransitionBuilder? builder,
  bool useRootNavigator = true,
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  String? cancelText,
  String? confirmText,
  String? helpText,
  String? errorInvalidText,
  String? hourLabelText,
  String? minuteLabelText,
  RouteSettings? routeSettings,
  EntryModeChangeCallback? onEntryModeChanged,
  Offset? anchorPoint,
}) async {
  assert(debugCheckHasMaterialLocalizations(context));

  final Widget dialog = ZeroTimePickerDialog(
    initialTime: initialTime,
    initialEntryMode: initialEntryMode,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
    errorInvalidText: errorInvalidText,
    hourLabelText: hourLabelText,
    minuteLabelText: minuteLabelText,
    onEntryModeChanged: onEntryModeChanged,
  );
  return showDialog<TimeOfDay>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}
