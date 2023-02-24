import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/widgetbook_component/accordion.dart';
import 'package:widgetbook_demo/widgetbook_component/alert_dialog.dart';
import 'package:widgetbook_demo/widgetbook_component/card.dart';
import 'package:widgetbook_demo/widgetbook_component/grid.dart';
import 'package:widgetbook_demo/widgetbook_component/speed_dial.dart';
import 'package:widgetbook_demo/widgetbook_component/stepper.dart';
import 'package:zero_ui_mobile/styles/theme.dart';

import 'widgetbook_component/app_bar.dart';
import 'widgetbook_component/avatar.dart';
import 'widgetbook_component/badge.dart';
import 'widgetbook_component/button.dart';
import 'widgetbook_component/button_group.dart';
import 'widgetbook_component/checkbox.dart';
import 'widgetbook_component/chip.dart';
import 'widgetbook_component/colors.dart';
import 'widgetbook_component/datepicker.dart';
import 'widgetbook_component/divider.dart';
import 'widgetbook_component/dropdown_button.dart';
import 'widgetbook_component/dropdown_menu.dart';
import 'widgetbook_component/icons.dart';
import 'widgetbook_component/list_tile.dart';
import 'widgetbook_component/navigation_bar.dart';
import 'widgetbook_component/navigation_drawer.dart';
import 'widgetbook_component/navigation_rail.dart';
import 'widgetbook_component/progress_indicator.dart';
import 'widgetbook_component/radio_group.dart';
import 'widgetbook_component/rating.dart';
import 'widgetbook_component/slider.dart';
import 'widgetbook_component/snackbar.dart';
import 'widgetbook_component/switch.dart';
import 'widgetbook_component/tab_bar.dart';
import 'widgetbook_component/text.dart';
import 'widgetbook_component/textfield.dart';
import 'widgetbook_component/timepicker.dart';
import 'widgetbook_component/tooltip.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Foundation',
          widgets: [
            colorWidgetbookComponent,
            textWidgetbookComponent,
            iconWidgetbookComponent,
          ],
        ),
        WidgetbookCategory(
          name: 'Component',
          folders: [
            WidgetbookFolder(name: 'Form', widgets: [
              textFieldWidgetbookComponent,
              radioGroupWidgetbookComponent,
              dropdownWidgetbookComponent,
              dropdownMenuWidgetbookComponent,
              checkboxWidgetbookComponent,
              switchWidgetbookComponent,
              sliderWidgetbookComponenet,
            ]),
            WidgetbookFolder(name: 'Button', widgets: [
              buttonWidgetbookComponent,
              buttonGroupWidgetbookComponent,
            ]),
            WidgetbookFolder(name: 'Navigation', widgets: [
              navigationBarWidgetbookComponent,
              navigationDrawerWidgetbookComponent,
              appBarWidgetbookComponent,
              navigationRailWidgetbookComponent,
              tabBarWidgetbookComponenet,
            ]),
          ],
          widgets: [
            ratingWidgetbookComponent,
            badgeWidgetbookComponent,
            tooltipWidgetbookComponent,
            listTileWidgetbookComponent,
            avatarWidgetbookComponent,
            dividerWidgetbookComponent,
            chipWidgetbookComponent,
            snackbarWidgetbookComponent,
            datepickerWidgetbookComponent,
            timepickerWidgetbookComponent,
            progressIndicatorWidgetbookComponent,
            alertDialogWidgetbookComponent,
            cardWidgetbookComponent,
            stepperWidgetbookComponent,
            speedDialWidgetbookComponent,
            accordionWidgetbookComponent,
            gridWidgetbookComponent,
          ],
        ),
      ],
      appInfo: AppInfo(name: 'Zero UI'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ZeroThemeData().toThemeData(),
        ),
      ],
    );
  }
}
