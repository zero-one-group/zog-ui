import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../options/options.dart';
import '../utils.dart';

WidgetbookComponent speedDialWidgetbookComponent = WidgetbookComponent(
  name: 'Speed Dial',
  useCases: [
    WidgetbookUseCase(
        name: 'Speed Dial',
        builder: (context) {
          final Color activeColor = context.knobs.options(
            label: 'Button Active Color',
            options: [...colorOptions],
          );

          final Color inactiveColor = context.knobs.options(
            label: 'Button Inactive Color',
            options: [...colorOptions],
          );

          final double buttonSize = context.knobs
              .number(
                label: 'Button Size',
                initialValue: 56,
              )
              .toDouble();

          final double spacing = context.knobs
              .number(
                label: 'Spacing',
                initialValue: 4,
              )
              .toDouble();

          final tooltipBrightness = context.knobs.options(
            label: 'Tooltip Type',
            options: [..._types],
          );

          final ZeroTooltipVariant tooltipVariant = context.knobs.options(
            label: 'Tooltip Variant',
            options: [..._variants],
          );

          final double elevation = context.knobs
              .number(
                label: 'Elevation',
                initialValue: 4,
              )
              .toDouble();

          final Color shadowColor = context.knobs.options(
            label: 'Shadow Color',
            options: [...colorOptions],
          );

          final ZeroSpeedDialDirection direction = context.knobs.options(
            label: 'Direction',
            options: [..._directions],
          );

          final FloatingActionButtonLocation position = context.knobs.options(
            label: 'Position',
            options: [..._positions],
          );

          Text? label;
          if (context.knobs.boolean(label: 'Show Label')) {
            label = Text(
                context.knobs.text(label: 'Label Text', initialValue: 'Label'));
          }

          return PreviewWidget(
            builder: (context) {
              return _SpeedDialExample(
                activeColor: activeColor,
                inactiveColor: inactiveColor,
                buttonSize: buttonSize,
                spacing: spacing,
                elevation: elevation,
                shadowColor: shadowColor,
                direction: direction,
                tooltipBrightness: tooltipBrightness,
                tooltipVariant: tooltipVariant,
                position: position,
                label: label,
              );
            },
          );
        }),
  ],
);

List<Option<Brightness>> _types = [
  const Option(label: 'Dark', value: Brightness.dark),
  const Option(label: 'Light', value: Brightness.light),
];

List<Option<ZeroTooltipVariant>> _variants = [
  const Option(label: 'Rectangle', value: ZeroTooltipVariant.rectangle),
  const Option(label: 'Custom', value: ZeroTooltipVariant.custom),
];

List<Option<ZeroSpeedDialDirection>> _directions = [
  const Option(label: 'Horizontal', value: ZeroSpeedDialDirection.horizontal),
  const Option(label: 'Vertical', value: ZeroSpeedDialDirection.vertical),
];

List<Option<FloatingActionButtonLocation>> _positions = [
  const Option(
      label: 'CenterBottom', value: FloatingActionButtonLocation.centerFloat),
  const Option(
      label: 'CenterTop', value: FloatingActionButtonLocation.centerTop),
  const Option(
      label: 'EndBottom', value: FloatingActionButtonLocation.endFloat),
  const Option(label: 'EndTop', value: FloatingActionButtonLocation.endTop),
  const Option(
      label: 'StartBottom', value: FloatingActionButtonLocation.startFloat),
  const Option(label: 'StartTop', value: FloatingActionButtonLocation.startTop),
];

class _SpeedDialExample extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final double buttonSize;
  final double spacing;
  final double elevation;
  final Color shadowColor;
  final ZeroSpeedDialDirection direction;
  final Brightness tooltipBrightness;
  final ZeroTooltipVariant tooltipVariant;
  final FloatingActionButtonLocation position;
  final Text? label;
  const _SpeedDialExample({
    required this.activeColor,
    required this.inactiveColor,
    required this.buttonSize,
    required this.spacing,
    required this.elevation,
    required this.shadowColor,
    required this.direction,
    required this.tooltipBrightness,
    required this.tooltipVariant,
    required this.position,
    this.label,
  });

  @override
  State<_SpeedDialExample> createState() => __SpeedDialExampleState();
}

class __SpeedDialExampleState extends State<_SpeedDialExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Tooltip Example'),
      ),
      floatingActionButton: ZeroSpeedDial(
        style: ZeroSpeedDialStyle(
          inactiveColor: widget.inactiveColor,
          activeColor: widget.activeColor,
          size: widget.buttonSize,
          spacing: widget.spacing,
          elevation: widget.elevation,
          shadowColor: widget.shadowColor,
        ),
        label: widget.label,
        direction: widget.direction,
        activeChild: const Icon(Icons.close),
        inactiveChild: const Icon(Icons.menu),
        tooltipVariant: widget.tooltipVariant,
        tooltipBrightness: widget.tooltipBrightness,
        children: [
          ZeroSpeedDialItem(
            tooltipText: const Text('Tooltip Text'),
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
          const ZeroSpeedDialItem(
            backgroundColor: Colors.red,
            child: Icon(Icons.add),
          ),
          const ZeroSpeedDialItem(
            tooltipText: Text('Add'),
            child: Text('data'),
          )
        ],
      ),
      floatingActionButtonLocation: widget.position,
      body: SafeArea(
        child: Container(width: double.infinity, color: Colors.white),
      ),
    );
  }
}
