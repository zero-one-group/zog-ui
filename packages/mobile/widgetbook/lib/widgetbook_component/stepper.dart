import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

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

        Text? label;
        if (context.knobs.boolean(label: 'Label', initialValue: false)) {
          label = const Text('Label');
        }

        final ZeroStepState stepState = context.knobs.options(
          label: 'Step State',
          options: [
            const Option(label: 'Indexed', value: ZeroStepState.indexed),
            const Option(label: 'Icon', value: ZeroStepState.customIcon),
            const Option(label: 'Disabled', value: ZeroStepState.disabled),
            const Option(label: 'Error', value: ZeroStepState.error),
          ],
        );

        Icon icon = context.knobs.options(
          label: 'Icon',
          options: [
            const Option(
              label: 'Edit',
              value: Icon(
                Icons.edit,
                size: 14,
              ),
            ),
            const Option(
              label: 'Add',
              value: Icon(
                Icons.add,
                size: 14,
              ),
            ),
            const Option(
              label: 'Delete',
              value: Icon(
                Icons.delete,
                size: 14,
              ),
            ),
            const Option(
              label: 'Done',
              value: Icon(
                Icons.done,
                size: 14,
              ),
            ),
            const Option(
              label: 'Close',
              value: Icon(
                Icons.close,
                size: 14,
              ),
            ),
            const Option(
              label: 'Arrow Back',
              value: Icon(
                Icons.arrow_back,
                size: 14,
              ),
            ),
            const Option(
              label: 'Arrow Forward',
              value: Icon(
                Icons.arrow_forward,
                size: 14,
              ),
            ),
          ],
        );

        return PreviewWidget(
          child: _ZeroStepperExample(
            type: type,
            stepState: stepState,
            label: label,
            title: title,
            content: content,
            cutomIcon: icon,
          ),
        );
      },
    ),
  ],
);

class _ZeroStepperExample extends StatefulWidget {
  final StepperType type;
  final ZeroStepState stepState;
  final Text? label;
  final bool title;
  final String content;
  final Icon cutomIcon;
  const _ZeroStepperExample({
    this.type = StepperType.vertical,
    this.stepState = ZeroStepState.indexed,
    this.label,
    this.title = true,
    this.content = 'Content',
    this.cutomIcon = const Icon(Icons.edit),
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
          subtitle: const Text('Subtitle 1'),
          content: Text(widget.content),
          state: widget.stepState,
          customIcon: widget.cutomIcon,
          label: widget.label,
        ),
        ZeroStep(
          isActive: currentStep == 1,
          title: widget.title ? const Text('Step 2') : const SizedBox(),
          subtitle: const Text('Subtitle 2'),
          content: Text(widget.content),
          state: widget.stepState,
          customIcon: widget.cutomIcon,
          label: widget.label,
        ),
        ZeroStep(
          isActive: currentStep == 2,
          title: widget.title ? const Text('Step 3') : const SizedBox(),
          subtitle: const Text('Subtitle 3'),
          content: Text(widget.content),
          state: widget.stepState,
          customIcon: widget.cutomIcon,
          label: widget.label,
        ),
      ],
    );
  }
}
