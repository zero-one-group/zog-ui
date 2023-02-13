import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'component/alert_dialog/zero_alert_dialog_example.dart';
import 'component/avatar/avatar_example.dart';
import 'component/button/zero_button_example.dart';
import 'component/chip/chip_example.dart';
import 'component/datepicker/datepicker_example.dart';
import 'component/divider/divider_example.dart';
import 'component/dropdown/zero_dropdown_example.dart';
import 'component/icon/icon_example.dart';
import 'component/listtile/listile_example.dart';
import 'component/navigation/app_bar_example.dart';
import 'component/navigation/navigation_bar_example.dart';
import 'component/navigation/navigation_drawer_example.dart';
import 'component/progress_indicator/zero_progress_indicator_example.dart';
import 'component/rating/zero_rating_example.dart';
import 'component/slider/zero_slider_example.dart';
import 'component/snackbar/zero_snackbar_example.dart';
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

  ShadedColor _selectedColor = ZeroColors.lime;

  @override
  Widget build(BuildContext context) {
    return ZeroApp(
      title: 'Flutter Demo',
      theme: ZeroThemeData(
          brightness: Brightness.light,
          primaryColor: _selectedColor.toAccentColor(),
          inputDecorationType: InputDecorationType.outline),
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
                child: SingleChildScrollView(
                  child: Examples(),
                ),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ZeroButton.primary(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ZeroDatePickerExample(),
                  ),
                );
              },
              text: 'Zero Time Picker Example',
            ),
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
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
