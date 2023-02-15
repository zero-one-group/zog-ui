import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent stepperWidgetbookComponent = WidgetbookComponent(
  name: 'Stepper',
  useCases: [
    WidgetbookUseCase(
      name: 'Stepper',
      builder: (context) {
        final StepperType type = context.knobs.options(
          label: 'Stepper Type',
          options: [
            const Option(label: 'Vertical', value: StepperType.vertical),
            const Option(label: 'Horizontal', value: StepperType.horizontal),
          ],
        );

        bool title = context.knobs.boolean(label: 'Title', initialValue: true);

        String content = context.knobs.text(
          label: 'Content',
          initialValue:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        );

        ZeroStepSubtitlePosition? subtitlePosition;
        if (context.knobs.boolean(label: 'Subtitle', initialValue: true)) {
          subtitlePosition = context.knobs.options(
            label: 'Subtitle Position',
            options: [
              const Option(label: 'Top', value: ZeroStepSubtitlePosition.top),
              const Option(label: 'Bottom', value: ZeroStepSubtitlePosition.bottom),
            ],
          );
        }

        Text? label;
        if (context.knobs.boolean(label: 'Label', initialValue: false)) {
          label = const Text('Label');
        }

        final StepState stepState = context.knobs.options(
          label: 'Step State',
          options: [
            const Option(label: 'Indexed', value: StepState.indexed),
            const Option(label: 'Editing', value: StepState.editing),
            const Option(label: 'Complete', value: StepState.complete),
            const Option(label: 'Disabled', value: StepState.disabled),
            const Option(label: 'Error', value: StepState.error),
          ],
        );

        return PreviewWidget(
          child: _ZeroStepperExample(
            type: type,
            subtitlePosition: subtitlePosition,
            stepState: stepState,
            label: label,
            title: title,
            content: content,
          ),
        );
      },
    ),
  ],
);

class _ZeroStepperExample extends StatefulWidget {
  final ZeroStepSubtitlePosition? subtitlePosition;
  final StepperType type;
  final StepState stepState;
  final Text? label;
  final bool title;
  final String content;
  const _ZeroStepperExample({
    this.subtitlePosition,
    this.type = StepperType.vertical,
    this.stepState = StepState.indexed,
    this.label,
    this.title = true,
    this.content = 'Content',
  });

  @override
  State<_ZeroStepperExample> createState() => __ZeroStepperExampleState();
}

class __ZeroStepperExampleState extends State<_ZeroStepperExample> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return ZeroStepper(
      type: widget.type,
      currentStep: currentStep,
      onStepContinue: () {
        setState(() {
          if (currentStep < 2) {
            currentStep++;
          } else {
            currentStep = 0;
          }
        });
      },
      steps: [
        ZeroStep(
          isActive: currentStep == 0,
          title: widget.title ? const Text('Step 1') : const SizedBox(),
          subtitle: widget.subtitlePosition == null ? null : const Text('Subtitle 1'),
          content: Text(widget.content),
          state: widget.stepState,
          subtitlePosition: widget.subtitlePosition ?? ZeroStepSubtitlePosition.top,
          label: widget.label,
        ),
        ZeroStep(
          isActive: currentStep == 1,
          title: widget.title ? const Text('Step 2') : const SizedBox(),
          subtitle: widget.subtitlePosition == null ? null : const Text('Subtitle 2'),
          content: Text(widget.content),
          state: widget.stepState,
          subtitlePosition: widget.subtitlePosition ?? ZeroStepSubtitlePosition.top,
          label: widget.label,
        ),
        ZeroStep(
          isActive: currentStep == 2,
          title: widget.title ? const Text('Step 3') : const SizedBox(),
          subtitle: widget.subtitlePosition == null ? null : const Text('Subtitle 3'),
          content: Text(widget.content),
          state: widget.stepState,
          subtitlePosition: widget.subtitlePosition ?? ZeroStepSubtitlePosition.top,
          label: widget.label,
        ),
      ],
    );
  }
}
