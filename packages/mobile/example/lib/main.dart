import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

import 'component/alert_dialog/zero_alert_dialog_example.dart';
import 'component/avatar/avatar_example.dart';
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
  final _colors = [
    ZeroColors.lime,
    ZeroColors.primary,
    ZeroColors.geekBlue,
    ZeroColors.dustRed,
    ZeroColors.magenta,
    ZeroColors.polarGreen,
  ];

  ShadedColor _selectedColor = ZeroColors.primary;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      title: 'Flutter Demo',
      theme: ZeroThemeData(
        brightness: Brightness.light,
        primaryColor: _selectedColor.toAccentColor(),
        inputDecorationType: InputDecorationType.outline,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              DropdownButton<ShadedColor>(
                  hint: Row(
                    children: [
                      const Text('Primary Color'),
                      const SizedBox(width: 10),
                      Container(width: 20, height: 20, color: _selectedColor)
                    ],
                  ),
                  items: _colors
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Container(color: e, height: 50),
                        ),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v != null) {
                      setState(() {
                        _selectedColor = v;
                      });
                    }
                  }),
              const Expanded(
                child: Examples(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Examples extends StatelessWidget {
  const Examples({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(width: double.infinity),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroCheckboxExample(),
              ),
            );
          },
          text: 'Zero Checkbox Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroRadioExample(),
              ),
            );
          },
          text: 'Zero Radio Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroButtonExample(),
              ),
            );
          },
          text: 'Zero Button Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroTextfieldExample(),
              ),
            );
          },
          text: 'Zero Textfield Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ZeroDropdownExample(),
              ),
            );
          },
          text: 'Zero Dropdown Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ZeroDropdownMenuExample(),
              ),
            );
          },
          text: 'Zero Dropdown Menu Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroRatingExample(),
              ),
            );
          },
          text: 'Zero Rating Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroSliderExample(),
              ),
            );
          },
          text: 'Zero Slider Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroTooltipExample(),
              ),
            );
          },
          text: 'Zero Tooltip Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroAvatarExample(),
              ),
            );
          },
          text: 'Zero Avatar Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroDividerExample(),
              ),
            );
          },
          text: 'Zero Divider Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroListTileExample(),
              ),
            );
          },
          text: 'Zero ListTile Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroChipExample(),
              ),
            );
          },
          text: 'Zero Chip Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroSwitchExample(),
              ),
            );
          },
          text: 'Zero Switch Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroProgressIndicatorExample(),
              ),
            );
          },
          text: 'Zero Progress Indicator Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroIconExample(),
              ),
            );
          },
          text: 'Zero Icon Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroSnackbarExample(),
              ),
            );
          },
          text: 'Zero Snackbar Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroNavigationBarExample(),
              ),
            );
          },
          text: 'Zero BottomNavigationBar Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroDatePickerExample(),
              ),
            );
          },
          text: 'Zero Date Picker Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroAlertDialogExample(),
              ),
            );
          },
          text: 'Zero Alert Dialog Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroNavigationDrawerExample(),
              ),
            );
          },
          text: 'Zero Navigation Drawer Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroTimePickerExample(),
              ),
            );
          },
          text: 'Zero Time Picker Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroAppBarExample(),
              ),
            );
          },
          text: 'Zero App Bar Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroCardExample(),
              ),
            );
          },
          text: 'Zero Card Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroStepperExample(),
              ),
            );
          },
          text: 'Zero Stepper Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroNavigationRailExample(),
              ),
            );
          },
          text: 'Zero Navigation Rail Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroTabsExample(),
              ),
            );
          },
          text: 'Zero Tabs Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroSpeedDialExample(),
              ),
            );
          },
          text: 'Zero Speed Dial Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroGridExample(),
              ),
            );
          },
          text: 'Zero Grid Example',
        ),
        const SizedBox(height: 12),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroButtonGroupExample(),
              ),
            );
          },
          text: 'Zero Button Group Example',
        ),
        ZeroButton.primary(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ZeroSkeletonExample(),
              ),
            );
          },
          text: 'Zero Skeleton Example',
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
