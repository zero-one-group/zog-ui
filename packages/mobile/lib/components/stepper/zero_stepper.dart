import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

part 'zero_step.dart';
part 'triangle_painter.dart';

const double _kStepSize = 24.0;
// Triangle height. sqrt(3.0) / 2.0
const double _kTriangleHeight = _kStepSize * 0.866025;

/// stepper is widget that displays progress through a sequence of
/// steps. Steppers are particularly useful in the case of forms where one step
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
class ZeroStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  const ZeroStepper({
    super.key,
    required this.steps,
    this.physics,
    this.type = StepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.style,
  }) : assert(0 <= currentStep && currentStep < steps.length);

  /// The style to be used for this stepper.
  final ZeroStepperStyle? style;

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<ZeroStep> steps;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics? physics;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final StepperType type;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int>? onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback? onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback? onStepCancel;

  /// The callback for creating custom controls.
  ///
  /// If null, the default controls from the current theme will be used.
  ///
  /// This callback which takes in a context and a [ControlsDetails] object, which
  /// contains step information and two functions: [onStepContinue] and [onStepCancel].
  /// These can be used to control the stepper. For example, reading the
  /// [ControlsDetails.currentStep] value within the callback can change the text
  /// of the continue or cancel button depending on which step users are at.
  final ControlsWidgetBuilder? controlsBuilder;

  @override
  State<ZeroStepper> createState() => _ZeroStepperState();
}

class _ZeroStepperState extends State<ZeroStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, ZeroStepState> _oldStates = <int, ZeroStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(ZeroStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isLabel() {
    for (final ZeroStep step in widget.steps) {
      if (step.label != null) {
        return true;
      }
    }
    return false;
  }

  Widget _buildLine(bool visible) {
    final theme = context.theme;
    final themeStyle = theme.stepperStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 16.0,
      color: adaptiveStyle.dividerColor,
    );
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);

    final ZeroStepState state =
        oldState ? _oldStates[index]! : widget.steps[index].state;
    switch (state) {
      case ZeroStepState.indexed:
      case ZeroStepState.disabled:
        return DefaultTextStyle(
          style: adaptiveStyle.indexTextStyle!,
          child: Text(
            '${index + 1}',
          ),
        );
      case ZeroStepState.customIcon:
        assert(widget.steps[index].customIcon != null,
            'customIcon must not be null');
        return widget.steps[index].customIcon!;
      case ZeroStepState.error:
        return Text('!', style: adaptiveStyle.indexTextStyle);
    }
  }

  Color _circleColor(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);
    if (widget.steps[index].isActive) {
      return adaptiveStyle.activeColor!;
    } else {
      return adaptiveStyle.inactiveColor!;
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(
            index,
            oldState && widget.steps[index].state == StepState.error,
          ),
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height: _kTriangleHeight,
          child: CustomPaint(
            painter: _TrianglePainter(
              color: adaptiveStyle.errorColor!,
            ),
            child: Align(
              // 0.8 looks better than the geometrical 0.33.
              alignment: const Alignment(0.0, 0.8),
              child: _buildCircleChild(
                index,
                oldState && widget.steps[index].state != StepState.error,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == StepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != StepState.error) {
        return _buildCircle(index, false);
      } else {
        return _buildTriangle(index, false);
      }
    }
  }

  Widget _buildVerticalControls(int stepIndex) {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder!(
        context,
        ControlsDetails(
          currentStep: widget.currentStep,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel,
          stepIndex: stepIndex,
        ),
      );
    }

    const OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    );
    const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48.0),
        child: Row(
          // The Material spec no longer includes a Stepper widget. The continue
          // and cancel button styles have been configured to match the original
          // version of this widget.
          children: <Widget>[
            ZeroButton.primary(
              style: const ZeroButtonStyle(
                shape: buttonShape,
                padding: buttonPadding,
              ),
              onPressed: () {
                if (widget.onStepContinue != null) {
                  widget.onStepContinue!();
                }
              },
              text: 'Continue',
            ),
            const SizedBox(width: 8.0),
            ZeroButton.text(
              style: const ZeroButtonStyle(
                shape: buttonShape,
                padding: buttonPadding,
              ),
              text: 'Cancel',
              onPressed: () {
                if (widget.onStepCancel != null) {
                  widget.onStepCancel!();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);

    switch (widget.steps[index].state) {
      case ZeroStepState.indexed:
      case ZeroStepState.customIcon:
        return adaptiveStyle.titleTextStyle!;
      case ZeroStepState.disabled:
        return adaptiveStyle.titleTextStyle!;
      case ZeroStepState.error:
        return adaptiveStyle.titleTextStyle!;
    }
  }

  TextStyle _subtitleStyle(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);

    switch (widget.steps[index].state) {
      case ZeroStepState.indexed:
      case ZeroStepState.customIcon:
        return adaptiveStyle.subtitleTextStyle!;
      case ZeroStepState.disabled:
        return adaptiveStyle.subtitleTextStyle!;
      case ZeroStepState.error:
        return adaptiveStyle.subtitleTextStyle!;
    }
  }

  TextStyle _labelStyle(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);

    switch (widget.steps[index].state) {
      case ZeroStepState.indexed:
      case ZeroStepState.customIcon:
        return adaptiveStyle.labelTextStyle!;
      case ZeroStepState.disabled:
        return adaptiveStyle.labelTextStyle!;
      case ZeroStepState.error:
        return adaptiveStyle.labelTextStyle!;
    }
  }

  TextStyle _contentStyle(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepStyle;
    final adaptiveStyle = themeStyle.merge(widget.steps[index].style);
    return adaptiveStyle.contentTextStyle!;
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(index),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(index),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle!,
            ),
          ),
      ],
    );
  }

  Widget _buildLabelText(int index) {
    if (widget.steps[index].label != null) {
      return AnimatedDefaultTextStyle(
        style: _labelStyle(index),
        duration: kThemeAnimationDuration,
        child: widget.steps[index].label!,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Line parts are always added in order for the ink splash to
              // flood the tips of the connector lines.
              _buildLine(!_isFirst(index)),
              _buildIcon(index),
              _buildLine(!_isLast(index)),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsetsDirectional.only(start: 12.0),
              child: _buildHeaderText(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(int index) {
    final theme = context.theme;
    final themeStyle = theme.stepperStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 1.0,
                child: Container(
                  color: adaptiveStyle.dividerColor,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: adaptiveStyle.margin,
            child: Column(
              children: <Widget>[
                DefaultTextStyle(
                  style: _contentStyle(index),
                  child: widget.steps[index].content,
                ),
                _buildVerticalControls(index),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildVertical() {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              InkWell(
                onTap: widget.steps[i].state != StepState.disabled
                    ? () {
                        // In the vertical case we need to scroll to the newly tapped
                        // step.
                        Scrollable.ensureVisible(
                          _keys[i].currentContext!,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );

                        widget.onStepTapped?.call(i);
                      }
                    : null,
                canRequestFocus: widget.steps[i].state != StepState.disabled,
                child: _buildVerticalHeader(i),
              ),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget _buildHorizontal() {
    final theme = context.theme;
    final themeStyle = theme.stepperStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != StepState.disabled
              ? () {
                  widget.onStepTapped?.call(i);
                }
              : null,
          canRequestFocus: widget.steps[i].state != StepState.disabled,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: _isLabel() ? 104.0 : 72.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (widget.steps[i].label != null)
                      const SizedBox(
                        height: 24.0,
                      ),
                    Center(child: _buildIcon(i)),
                    if (widget.steps[i].label != null)
                      SizedBox(
                        height: 24.0,
                        child: _buildLabelText(i),
                      ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(start: 12.0),
                child: _buildHeaderText(i),
              ),
            ],
          ),
        ),
        if (!_isLast(i))
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 1.0,
              color: adaptiveStyle.dividerColor,
            ),
          ),
      ],
    ];

    final List<Widget> stepPanels = <Widget>[];
    for (int i = 0; i < widget.steps.length; i += 1) {
      stepPanels.add(
        Visibility(
          maintainState: true,
          visible: i == widget.currentStep,
          child: DefaultTextStyle(
            style: _contentStyle(i),
            child: widget.steps[i].content,
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        Material(
          elevation: adaptiveStyle.elevation!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: children,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            padding: const EdgeInsets.all(24.0),
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: stepPanels),
              ),
              _buildVerticalControls(widget.currentStep),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<Stepper>() != null) {
        throw FlutterError(
          'Steppers must not be nested.\n'
          'The material specification advises that one should avoid embedding '
          'steppers within steppers. '
          'https://material.io/archive/guidelines/components/steppers.html#steppers-usage',
        );
      }
      return true;
    }());
    switch (widget.type) {
      case StepperType.vertical:
        return _buildVertical();
      case StepperType.horizontal:
        return _buildHorizontal();
    }
  }
}
