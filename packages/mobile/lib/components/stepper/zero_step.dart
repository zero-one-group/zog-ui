import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroStep extends Step {
  ZeroStep({
    /// [title] is the title of the step.
    required Widget title,

    /// [subtitle] is the subtitle of the step.
    Widget? subtitle,

    /// [content] is the content of the step.
    required Widget content,

    /// [state] is the state of the step.
    /// The default value is [StepState.indexed].
    /// the [StepState] can be [StepState.indexed], [StepState.editing], [StepState.complete], [StepState.disabled], [StepState.error]
    StepState state = StepState.indexed,

    /// [isActive] is the boolean value to determine whether the step is active or not.
    bool isActive = false,

    /// [label] is the label of the step.
    Widget? label,

    /// [subtitlePosition] is the position of the subtitle.
    /// when [subtitlePosition] is [ZeroStepSubtitlePosition.top], the [subtitle] will be shown above the [title].
    ZeroStepSubtitlePosition subtitlePosition = ZeroStepSubtitlePosition.bottom,
  }) : super(
          title: subtitlePosition == ZeroStepSubtitlePosition.top
              ? Builder(
                  builder: (context) {
                    return DefaultTextStyle(
                      style: context.theme.typography.caption ?? const TextStyle(),
                      child: subtitle ?? const SizedBox(),
                    );
                  },
                )
              : title,
          subtitle: subtitlePosition == ZeroStepSubtitlePosition.top
              ? Builder(
                  builder: (context) {
                    return DefaultTextStyle(
                      style: context.theme.typography.body1 ?? const TextStyle(),
                      child: title,
                    );
                  },
                )
              : subtitle,
          content: content,
          state: state,
          isActive: isActive,
          label: label,
        );
}
