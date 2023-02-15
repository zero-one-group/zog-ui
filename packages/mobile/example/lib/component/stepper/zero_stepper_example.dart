import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroStepperExample extends StatefulWidget {
  const ZeroStepperExample({super.key});

  @override
  State<ZeroStepperExample> createState() => _ZeroStepperExampleState();
}

class _ZeroStepperExampleState extends State<ZeroStepperExample> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Stepper Example'),
      ),
      body: ZeroStepper(
        type: StepperType.vertical,
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
        controlsBuilder: (BuildContext context, ControlsDetails cd) {
          return Row(
            children: [
              TextButton(
                onPressed: cd.onStepContinue,
                child: const Text('Next'),
              ),
              TextButton(
                onPressed: cd.onStepCancel,
                child: const Text('Cancel'),
              ),
            ],
          );
        },
        steps: [
          ZeroStep(
            isActive: currentStep == 0,
            title: Text('Step 1'),
            subtitle: Text('Subtitle 1'),
            content: Text('Step 1'),
            subtitlePosition: ZeroStepSubtitlePosition.top,
          ),
          ZeroStep(
            isActive: currentStep == 1,
            title: Text('Step 2'),
            content: Text('Step 2'),
          ),
          ZeroStep(
            isActive: currentStep == 2,
            title: Text('Step 3'),
            content: Text('Step 3'),
          ),
        ],
      ),
    );
  }
}
