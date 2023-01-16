import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'widgetbook_component/button.dart';
import 'widgetbook_component/button_group.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Inputs',
          widgets: [buttonWidgetbookComponenet, buttonGroupWidgetbookComponent],
        ),
      ],
      appInfo: AppInfo(name: 'Widgetbook'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
      ],
    );
  }
}
