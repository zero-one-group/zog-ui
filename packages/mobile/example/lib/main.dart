import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zog_ui/zog_ui.dart';

import 'component/accordion/zero_accordion_example.dart';
import 'component/alert_dialog/zero_alert_dialog_example.dart';
import 'component/avatar/avatar_example.dart';
import 'component/bottom_sheet/bottom_sheet_example.dart';
import 'component/button/button_group_example.dart';
import 'component/button/zero_button_example.dart';
import 'component/card/zero_card_example.dart';
import 'component/checkbox/checkbox_example.dart';
import 'component/chip/chip_example.dart';
import 'component/datepicker/datepicker_example.dart';
import 'component/divider/divider_example.dart';
import 'component/dropdown/zero_dropdown_example.dart';
import 'component/dropdown/zero_dropdown_menu_example.dart';
import 'component/grid/zero_grid_example.dart';
import 'component/icon/icon_example.dart';
import 'component/listtile/listile_example.dart';
import 'component/navigation/app_bar_example.dart';
import 'component/navigation/navigation_bar_example.dart';
import 'component/navigation/navigation_drawer_example.dart';
import 'component/navigation/navigation_rail_example.dart';
import 'component/navigation/tabs_example.dart';
import 'component/progress_indicator/zero_progress_indicator_example.dart';
import 'component/radio/radio_example.dart';
import 'component/rating/zero_rating_example.dart';
import 'component/skeleton/zero_skeleton_example.dart';
import 'component/slider/zero_slider_example.dart';
import 'component/snackbar/zero_snackbar_example.dart';
import 'component/speed_dial/zero_speed_dial_example.dart';
import 'component/stepper/zero_stepper_example.dart';
import 'component/switch/zero_switch_example.dart';
import 'component/textfield/zero_textfield_example.dart';
import 'component/timepicker/zero_timepicker_example.dart';
import 'component/tooltip/zero_tooltip_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _searchController = TextEditingController();
  final _initialData = examplesData.entries;
  final List<MapEntry<String, Widget>> _searchData = [];
  InputDecorationType _defaultDecorationType = InputDecorationType.outline;

  final _colors = [
    ZeroColors.lime,
    ZeroColors.primary,
    ZeroColors.geekBlue,
    ZeroColors.dustRed,
    ZeroColors.magenta,
    ZeroColors.polarGreen,
  ];

  ShadedColor _selectedColor = ZeroColors.primary;
  bool _customFont = false;
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      title: 'Flutter Demo',
      theme: ZeroThemeData(
          fontFamily:
              _customFont ? GoogleFonts.dancingScript().fontFamily : null,
          brightness: _dark ? Brightness.dark : Brightness.light,
          primaryColor: _selectedColor.toAccentColor(),
          textfieldStyleSet: ZeroTextfieldStyleSet.fallback(
              textfieldSize: ZeroTextfieldSize.small,
              defaultDecorationType: _defaultDecorationType,
              focusedBorderColor: _selectedColor,
              focusedColor: _selectedColor)),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text('Custom Font'),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: ZeroCheckbox(
                        value: _customFont,
                        onChanged: (value) {
                          setState(() {
                            _customFont = value ?? false;
                          });
                        },
                      ),
                    ),
                    const Text('Dark'),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: ZeroCheckbox(
                        value: _dark,
                        onChanged: (value) {
                          setState(() {
                            _dark = value ?? false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const ZeroDivider.horizontal(
                    style: ZeroDividerStyle(size: 2),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Primary Color'),
                          const SizedBox(
                            height: 4,
                          ),
                          ZeroDropdownButtonFormField<ShadedColor>(
                            hint: Row(
                              children: [
                                const Text('Primary Color'),
                                const SizedBox(width: 10),
                                Container(
                                  width: 20,
                                  height: 20,
                                  color: _selectedColor,
                                )
                              ],
                            ),
                            value: _selectedColor,
                            items: _colors
                                .map((e) => ZeroDropdownMenuItem<ShadedColor>(
                                      value: e,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: [
                                            Text(e.toHex()),
                                            const SizedBox(width: 10),
                                            Container(
                                              width: 20,
                                              height: 20,
                                              color: e,
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value == null) return;

                              setState(() {
                                _selectedColor = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Default Input Decoration'),
                          const SizedBox(
                            height: 4,
                          ),
                          ZeroDropdownButtonFormField<InputDecorationType>(
                            hint: const Text('Default Input Decoration'),
                            items: InputDecorationType.values
                                .map((e) =>
                                    ZeroDropdownMenuItem<InputDecorationType>(
                                      value: e,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text(e.name),
                                      ),
                                    ))
                                .toList(),
                            value: _defaultDecorationType,
                            onChanged: (value) {
                              if (value == null) return;

                              setState(() {
                                _defaultDecorationType = value;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ZeroTextField(
                  hintText: 'Search Component',
                  controller: _searchController,
                  decoration: const InputDecoration(filled: true),
                  onChanged: (v) {
                    _search(v);
                  },
                ),
              ),
              Expanded(
                child: Examples(
                  data: _searchController.text.isEmpty
                      ? _initialData
                      : _searchData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _search(String query) {
    final result = <MapEntry<String, Widget>>[];

    for (final item in _initialData) {
      if (item.key.toLowerCase().contains(query.toLowerCase().trim())) {
        result.add(item);
      }
    }

    setState(() {
      _searchData.clear();
      _searchData.addAll(result);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class Examples extends StatelessWidget {
  const Examples({super.key, required this.data});

  final Iterable<MapEntry<String, Widget>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      itemCount: data.length,
      itemBuilder: (context, index) => ZeroButton.primary(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => data.elementAt(index).value,
            ),
          );
        },
        child: Text(data.elementAt(index).key),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }
}

final examplesData = {
  'Zero Checkbox Example': const ZeroCheckboxExample(),
  'Zero Radio Example': const ZeroRadioExample(),
  'Zero Button Example': const ZeroButtonExample(),
  'Zero Textfield Example': const ZeroTextfieldExample(),
  'Zero Dropdown Example': ZeroDropdownExample(),
  'Zero Dropdown Menu Example': ZeroDropdownMenuExample(),
  'Zero Rating Example': const ZeroRatingExample(),
  'Zero Slider Example': const ZeroSliderExample(),
  'Zero Tooltip Example': const ZeroTooltipExample(),
  'Zero Avatar Example': const ZeroAvatarExample(),
  'Zero Divider Example': const ZeroDividerExample(),
  'Zero ListTile Example': const ZeroListTileExample(),
  'Zero Chip Example': const ZeroChipExample(),
  'Zero Switch Example': const ZeroSwitchExample(),
  'Zero Progress Indicator Example': const ZeroProgressIndicatorExample(),
  'Zero Icon Example': const ZeroIconExample(),
  'Zero Snackbar Example': const ZeroSnackbarExample(),
  'Zero BottomNavigationBar Example': const ZeroNavigationBarExample(),
  'Zero Date Picker Example': const ZeroDatePickerExample(),
  'Zero Alert Dialog Example': const ZeroAlertDialogExample(),
  'Zero Navigation Drawer Example': const ZeroNavigationDrawerExample(),
  'Zero Time Picker Example': const ZeroTimePickerExample(),
  'Zero App Bar Example': const ZeroAppBarExample(),
  'Zero Card Example': const ZeroCardExample(),
  'Zero Stepper Example': const ZeroStepperExample(),
  'Zero Navigation Rail Example': const ZeroNavigationRailExample(),
  'Zero Tabs Example': const ZeroTabsExample(),
  'Zero Speed Dial Example': const ZeroSpeedDialExample(),
  'Zero Grid Example': const ZeroGridExample(),
  'Zero Button Group Example': const ZeroButtonGroupExample(),
  'Zero Skeleton Example': const ZeroSkeletonExample(),
  'Zero Accordion Example': const ZeroAccordionExample(),
  'Zero BottomSheet Example': const ZeroBottomSheetExample(),
};
