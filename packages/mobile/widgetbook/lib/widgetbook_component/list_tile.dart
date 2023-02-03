import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent listTileWidgetbookComponent = WidgetbookComponent(
  name: 'List Tile',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: 'List Item',
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Subtitle',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left Icon',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          leftIcon:
              context.knobs.options(label: 'Left Icon', options: _leftIcons),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Right Icon',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          rightIcon:
              context.knobs.options(label: 'Right Icon', options: _rightIcons),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left & Right Icon',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          leftIcon:
              context.knobs.options(label: 'Left Icon', options: _leftIcons),
          rightIcon:
              context.knobs.options(label: 'Right Icon', options: _rightIcons),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          leftIcon:
              context.knobs.options(label: 'Left Icon', options: _leftIcons),
          rightIcon:
              context.knobs.options(label: 'Right Icon', options: _rightIcons),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: true),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Style',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          leftIcon:
              context.knobs.options(label: 'Left Icon', options: _leftIcons),
          rightIcon:
              context.knobs.options(label: 'Right Icon', options: _rightIcons),
          style: ZeroListTileStyle(
            backgroundColor: context.knobs
                .options(label: 'Background Color', options: _colors),
            dividerColor:
                context.knobs.options(label: 'Divider Color', options: _colors),
            selectedColor: context.knobs
                .options(label: 'Selected Color', options: _colors),
            subTitleTextStyle: TextStyle(
                color: context.knobs
                    .options(label: 'Text Color', options: _textColors),
                fontSize: 14),
            titleTextStyle: TextStyle(
                color: context.knobs
                    .options(label: 'Text Color', options: _textColors),
                fontSize: 16),
          ),
          onTap: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Slidable',
      builder: (context) => _ListTilePreview(
        child: ZeroListTile(
          title: context.knobs.text(label: 'Title', initialValue: 'List Item'),
          subtitle:
              context.knobs.text(label: 'Subtitle', initialValue: 'Secondary '),
          selected: context.knobs.boolean(label: 'Selected'),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          withDivider: context.knobs.boolean(label: 'With Divider'),
          leftIcon:
              context.knobs.options(label: 'Left Icon', options: _leftIcons),
          rightIcon:
              context.knobs.options(label: 'Right Icon', options: _rightIcons),
          startSlideActions: context.knobs.options(
            label: 'Start Slidable Actions',
            options: _startActions,
          ),
          endSlideActions: context.knobs.options(
            label: 'End Slidable Actions',
            options: _endActions,
          ),
          onTap: () {},
        ),
      ),
    ),
  ],
);

class _ListTilePreview extends StatelessWidget {
  const _ListTilePreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreviewWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: SingleChildScrollView(child: child),
        );
      }),
    );
  }
}

List<Option<Icon>> _leftIcons = [
  const Option(label: 'Search', value: Icon(Icons.search)),
  const Option(label: 'Add', value: Icon(Icons.add)),
  const Option(label: 'Delete', value: Icon(Icons.delete)),
  const Option(label: 'Edit', value: Icon(Icons.edit)),
  const Option(label: 'Settings', value: Icon(Icons.settings)),
  const Option(label: 'Share', value: Icon(Icons.share)),
  const Option(label: 'Save', value: Icon(Icons.save)),
  const Option(label: 'Close', value: Icon(Icons.close)),
];

List<Option<Icon>> _rightIcons = [
  const Option(label: 'Next', value: Icon(Icons.navigate_next)),
  const Option(label: 'Expand More', value: Icon(Icons.expand_more)),
  const Option(label: 'Expand Less', value: Icon(Icons.expand_less)),
];

List<Option<ZeroListTileSize>> _sizeTypes = [
  const Option(label: 'Large', value: ZeroListTileSize.large),
  const Option(label: 'Small', value: ZeroListTileSize.small),
];

List<Option<Color>> _colors = [
  Option(label: 'Dust Red', value: ZeroColors.dustRed[6]),
  Option(label: 'Primary', value: ZeroColors.primary[6]),
  Option(label: 'Sunrise Yellow', value: ZeroColors.sunriseYellow[6]),
  Option(label: 'Sunset Orange', value: ZeroColors.sunsetOrange[6]),
  const Option(label: 'Black', value: ZeroColors.black),
  const Option(label: 'White', value: ZeroColors.white),
];

List<Option<Color>> _textColors = [
  const Option(label: 'Black', value: ZeroColors.black),
  const Option(label: 'White', value: ZeroColors.white),
];

List<Option<List<ZeroListTileAction>>> _startActions = [
  const Option(label: 'None', value: []),
  const Option(label: 'Share', value: [
    ZeroListTileAction(
      label: 'Share',
      icon: Icons.share,
      backgroundColor: ZeroColors.primary,
      foregroundColor: Colors.white,
    )
  ]),
  Option(label: 'Share & Archive', value: [
    const ZeroListTileAction(
      label: 'Share',
      icon: Icons.share,
      backgroundColor: ZeroColors.primary,
      foregroundColor: Colors.white,
    ),
    ZeroListTileAction(
      label: 'Archive',
      icon: Icons.archive,
      backgroundColor: ZeroColors.primary[8],
      foregroundColor: Colors.white,
    )
  ]),
];

List<Option<List<ZeroListTileAction>>> _endActions = [
  const Option(label: 'None', value: []),
  const Option(label: 'Delete', value: [
    ZeroListTileAction(
      label: 'Delete',
      icon: CupertinoIcons.delete_solid,
      backgroundColor: ZeroColors.danger,
      foregroundColor: Colors.white,
    )
  ]),
  const Option(label: 'Delete & More', value: [
    ZeroListTileAction(
      label: 'Delete',
      icon: CupertinoIcons.delete_solid,
      backgroundColor: ZeroColors.danger,
      foregroundColor: Colors.white,
    ),
    ZeroListTileAction(
      label: 'More',
      icon: Icons.more_horiz,
    ),
  ]),
];
