import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

const String sampleUrl1 =
    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80';
const String sampleUrl2 =
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80';

List<ZeroAvatar> avatars = [
  const ZeroAvatar.url(
    sampleUrl1,
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.url(
    sampleUrl2,
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.initial(
    'Wisnu',
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.url(
    sampleUrl1,
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.initial(
    'Zuhlhijaya Zulhijaya',
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.url(
    sampleUrl2,
    size: AvatarSize.xs,
  ),
  const ZeroAvatar.initial(
    'Zuhlhijaya Zulhijaya',
    size: AvatarSize.xs,
  ),
];

WidgetbookComponent avatarWidgetbookComponent = WidgetbookComponent(
  name: 'Avatar',
  useCases: [
    WidgetbookUseCase(
        name: 'Avatar',
        builder: (context) {
          return PreviewWidget(
              child: ZeroAvatar.url(
            context.knobs.options(label: 'Image URL', options: [
              const Option(
                label: 'URL 1',
                value: sampleUrl1,
              ),
              const Option(
                label: 'URL 2',
                value: sampleUrl2,
              ),
            ]),
            size: context.knobs.options(label: 'Size', options: _sizeOptions),
            withBadge:
                context.knobs.boolean(label: 'With Badge', initialValue: false),
            style: ZeroAvatarStyle(
              backgroundColor: context.knobs
                  .options(label: 'Avatar Background Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
              badgeColor: context.knobs.options(label: 'Badge Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
              borderColor:
                  context.knobs.options(label: 'Border Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
            ),
          ));
        }),
    WidgetbookUseCase(
        name: 'Initial',
        builder: (context) {
          return PreviewWidget(
              child: ZeroAvatar.initial(
            context.knobs.options(label: 'Full Name', options: [
              const Option(
                label: 'Muhammad R Kahfi',
                value: 'Muhammad R Kahfi',
              ),
              const Option(
                label: 'Zuhhijaya Zulhijaya',
                value: 'Zuhhijaya Zulhijaya',
              ),
              const Option(
                label: 'Wisnu G Saputra',
                value: 'Wisnu G Saputra',
              ),
            ]),
            size: context.knobs.options(label: 'Size', options: _sizeOptions),
            withBadge:
                context.knobs.boolean(label: 'With Badge', initialValue: false),
            style: ZeroAvatarStyle(
              backgroundColor: context.knobs
                  .options(label: 'Avatar Background Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
              badgeColor: context.knobs.options(label: 'Badge Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
              borderColor:
                  context.knobs.options(label: 'Border Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
              initialColor:
                  context.knobs.options(label: 'Initial Color', options: [
                const Option(label: 'Default', value: null),
                ...colorOptions,
              ]),
            ),
          ));
        }),
    WidgetbookUseCase(
        name: 'Avatar Group',
        builder: (context) {
          return PreviewWidget(
            child: ZeroAvatarGroup(
              moreNumber: context.knobs
                  .number(
                    label: 'More Count',
                    initialValue: 1,
                  )
                  .toInt(),
              avatars:
                  context.knobs.options(label: 'List of Avatars', options: [
                Option(label: '3 Items', value: avatars.sublist(0, 2)),
                Option(label: '5 Items', value: avatars.sublist(0, 4)),
                Option(label: '7 Items', value: avatars.sublist(0, 6))
              ]),
              size: context.knobs.options(label: 'Size', options: _sizeOptions),
            ),
          );
        }),
  ],
);

List<Option<AvatarSize>> _sizeOptions = [
  const Option(
    label: 'M',
    value: AvatarSize.m,
  ),
  const Option(
    label: 'XXS',
    value: AvatarSize.xxs,
  ),
  const Option(
    label: 'XS',
    value: AvatarSize.xs,
  ),
  const Option(
    label: 'S',
    value: AvatarSize.s,
  ),
  const Option(
    label: 'L',
    value: AvatarSize.l,
  ),
  const Option(
    label: 'XL',
    value: AvatarSize.xl,
  ),
  const Option(
    label: 'XXL',
    value: AvatarSize.xl,
  ),
];
