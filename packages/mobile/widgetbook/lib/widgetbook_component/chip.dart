import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent chipWidgetbookComponent = WidgetbookComponent(
  name: 'Chip',
  useCases: [
    WidgetbookUseCase(
      name: 'Filled without Cancel Icon',
      builder: (context) => PreviewWidget(
        child: ZeroChipFilled(
          label: context.knobs
              .text(label: 'Text Label', initialValue: 'Chip Label'),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          onTap: () {},
          size: context.knobs.options(label: 'Size', options: _sizeOptions),
          avatar:
              context.knobs.options(label: 'Avatar', options: _avatarOptions),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Filled with Cancel Icon',
      builder: (context) => PreviewWidget(
        child: ZeroChipFilled(
          label: context.knobs
              .text(label: 'Text Label', initialValue: 'Chip Label'),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          onTap: () {},
          size: context.knobs.options(label: 'Size', options: _sizeOptions),
          avatar:
              context.knobs.options(label: 'Avatar', options: _avatarOptions),
          onTapCancel: () {},
          cancelIcon: context.knobs
              .options(label: 'Cancel Icon', options: _iconOptions),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Outlined without Cancel Icon',
      builder: (context) => PreviewWidget(
        child: ZeroChipOutlined(
          label: context.knobs
              .text(label: 'Text Label', initialValue: 'Chip Label'),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          onTap: () {},
          size: context.knobs.options(label: 'Size', options: _sizeOptions),
          avatar:
              context.knobs.options(label: 'Avatar', options: _avatarOptions),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Outlined with Cancel Icon',
      builder: (context) => PreviewWidget(
        child: ZeroChipOutlined(
          label: context.knobs
              .text(label: 'Text Label', initialValue: 'Chip Label'),
          disabled:
              context.knobs.boolean(label: 'Disabled', initialValue: false),
          onTap: () {},
          size: context.knobs.options(label: 'Size', options: _sizeOptions),
          avatar:
              context.knobs.options(label: 'Avatar', options: _avatarOptions),
          onTapCancel: () {},
          cancelIcon: context.knobs
              .options(label: 'Cancel Icon', options: _iconOptions),
        ),
      ),
    ),
  ],
);

List<Option<ZeroChipSize>> _sizeOptions = [
  const Option(label: 'Small', value: ZeroChipSize.small),
  const Option(label: 'Large', value: ZeroChipSize.large),
];

List<Option<IconData>> _iconOptions = [
  const Option(label: 'Cancel', value: Icons.cancel),
  const Option(label: 'Close', value: Icons.close_rounded),
  const Option(label: 'Delete', value: Icons.delete),
  const Option(label: 'Add', value: Icons.add),
];

List<Option<Widget?>> _avatarOptions = [
  const Option(label: 'None', value: null),
  const Option(
    label: 'Avatar',
    value: ZeroAvatar.url(
      'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?fit=crop&w=80&h=80&q=80',
      size: AvatarSize.xs,
    ),
  ),
];
