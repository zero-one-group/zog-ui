import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// [ZeroStepper] is widget that can be used to display a list of steps based on [Stepper] widget.
/// Steppers are particularly useful in the case of forms where one step requires
/// the completion of another one, or where multiple steps need to be completed
class ZeroStepper extends StatelessWidget {
  /// [steps] is a list of [ZeroStep] which is contains the title, subtitle, content, and state of each step.
  final List<ZeroStep> steps;

  /// [elevation] is shadow of the stepper to make it look like it is floating.
  /// The default value is 0.
  final double? elevation;

  /// [currentStep] is the index of the current step.
  final int currentStep;

  /// [type] is the type of stepper.
  /// The default value is [StepperType.vertical].
  final StepperType type;

  /// [onStepTapped] is called when a step is tapped, with its index passed as an argument.
  final Function(int)? onStepTapped;

  /// [onStepContinue] is called when the continue button is tapped.
  final Function()? onStepContinue;

  /// [onStepCancel] is called when the cancel button is tapped.
  final Function()? onStepCancel;

  /// [physics] is the physics of the stepper.
  final ScrollPhysics? physics;

  /// [margin] is the margin of the stepper.
  final EdgeInsetsGeometry? margin;

  /// [controlsBuilder] is a builder that is called to create the controls.
  /// for creating custom controls for the stepper.
  final Widget Function(BuildContext, ControlsDetails)? controlsBuilder;
  const ZeroStepper({
    super.key,
    required this.steps,
    this.elevation = 0,
    this.currentStep = 0,
    this.type = StepperType.vertical,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.physics,
    this.margin,
    this.controlsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      key: key,
      steps: steps,
      elevation: elevation,
      currentStep: currentStep,
      type: type,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      physics: physics,
      margin: margin,
      controlsBuilder: controlsBuilder,
    );
  }
}
