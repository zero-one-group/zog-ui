part of 'zero_stepper.dart';

enum ZeroStepState {
  indexed,
  disabled,
  error,
  customIcon,
}

@immutable
class ZeroStep {
  /// Creates a step for a [Stepper].
  ///
  /// The [title], [content], and [state] arguments must not be null.
  const ZeroStep({
    required this.title,
    this.subtitle,
    required this.content,
    this.state = ZeroStepState.indexed,
    this.customIcon,
    this.isActive = false,
    this.label,
    this.style,
  });

  final ZeroStepStyle? style;

  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget? subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  final Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final ZeroStepState state;

  /// customizes the icon of the step when [state] is set to [ZeroStepState.customIcon]
  final Widget? customIcon;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;

  /// Only [StepperType.horizontal], Optional widget that appears under the [title].
  /// By default, uses the `bodyLarge` theme.
  final Widget? label;
}
