import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent colorWidgetbookComponent = WidgetbookComponent(
  name: 'Colors',
  useCases: [
    WidgetbookUseCase(
      name: 'Pallete',
      builder: (context) => Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          final selected = context.knobs.options(
            options: _colorOptions,
            label: 'Color',
          );

          late Option<ShadedColor> color;
          for (var i in _colorOptions) {
            if (i.value.value == selected.value) {
              color = i;
              break;
            }
          }

          final maxHeight = constraints.maxHeight;
          final itemHeight = maxHeight / color.value.swatch.length;

          return Column(
            children: color.value.swatch.entries
                .map(
                  (e) => Container(
                    height: itemHeight,
                    width: double.infinity,
                    color: e.value,
                    padding: const EdgeInsets.all(20),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: e.key >= 6 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${color.label} ${e.key}',
                            ),
                          ),
                          const SizedBox(width: 40),
                          Text(e.value.toHex()),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        }),
      ),
    ),
  ],
);

List<Option<ShadedColor>> _colorOptions = [
  const Option(label: 'Primary', value: ZeroColors.primary),
  const Option(label: 'Calendula Gold', value: ZeroColors.calendulaGold),
  const Option(label: 'Sunrise Yellow', value: ZeroColors.sunriseYellow),
  const Option(label: 'Lime', value: ZeroColors.lime),
  const Option(label: 'Polar Green', value: ZeroColors.polarGreen),
  const Option(label: 'Dust Red', value: ZeroColors.dustRed),
  const Option(label: 'Vocano', value: ZeroColors.vocano),
  const Option(label: 'Sunset Orange', value: ZeroColors.sunsetOrange),
  const Option(label: 'Geek Blue', value: ZeroColors.geekBlue),
  const Option(label: 'Golden Purple', value: ZeroColors.goldenPurple),
  const Option(label: 'Magenta', value: ZeroColors.magenta),
  const Option(label: 'Neutral', value: ZeroColors.neutral),
];
