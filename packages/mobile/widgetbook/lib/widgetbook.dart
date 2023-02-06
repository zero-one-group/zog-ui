import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/styles/theme.dart';

import 'widgetbook_component/avatar.dart';
import 'widgetbook_component/badge.dart';
import 'widgetbook_component/button.dart';
import 'widgetbook_component/button_group.dart';
import 'widgetbook_component/checkbox.dart';
import 'widgetbook_component/chip.dart';
import 'widgetbook_component/colors.dart';
import 'widgetbook_component/divider.dart';
import 'widgetbook_component/dropdown.dart';
import 'widgetbook_component/icons.dart';
import 'widgetbook_component/list_tile.dart';
import 'widgetbook_component/navigation_bar.dart';
import 'widgetbook_component/progress_indicator.dart';
import 'widgetbook_component/radio_group.dart';
import 'widgetbook_component/rating.dart';
import 'widgetbook_component/slider.dart';
import 'widgetbook_component/snackbar.dart';
import 'widgetbook_component/switch.dart';
import 'widgetbook_component/text.dart';
import 'widgetbook_component/textfield.dart';
import 'widgetbook_component/tooltip.dart';
import 'widgetbook_component/datepicker.dart';

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
              checkboxWidgetbookComponent,
              switchWidgetbookComponent,
            ]),
            WidgetbookFolder(name: 'Button', widgets: [
              buttonWidgetbookComponent,
              buttonGroupWidgetbookComponent,
            ]),
            WidgetbookFolder(name: 'Navigation', widgets: [
              navigationBarWidgetbookComponent,
            ]),
          ],
          widgets: [
            ratingWidgetbookComponent,
            badgeWidgetbookComponent,
            tooltipWidgetbookComponent,
            listTileWidgetbookComponent,
            sliderWidgetbookComponenet,
            avatarWidgetbookComponent,
            dividerWidgetbookComponent,
            chipWidgetbookComponent,
            snackbarWidgetbookComponent,
            progressIndicatorWidgetbookComponent,
            datepickerWidgetbookComponent,
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
