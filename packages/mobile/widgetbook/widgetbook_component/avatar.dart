import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

const String sampleUrl1 = 'https://shorturl.at/bgKVW';
const String sampleUrl2 = 'https://shorturl.at/jpvwX';

List<ZeroAvatar> avatars = [
  ZeroAvatar.url(
    'https://shorturl.at/dknSY',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://shorturl.at/dknSY',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Wisnu',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://shorturl.at/dknSY',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Zuhlhijaya Zulhijaya',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://shorturl.at/dknSY',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
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
          return Center(
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
            size: context.knobs.options(label: 'Size', options: [
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
                label: 'M',
                value: AvatarSize.m,
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
            ]),
            withBadge: context.knobs
                .nullableBoolean(label: 'With Badge', initialValue: false),
            backgroundColor: context.knobs
                .options(label: 'Avatar Background Color', options: [
              Option(
                label: 'Primary 7',
                value: ZeroColors.primary[7],
              ),
              const Option(
                label: 'White',
                value: ZeroColors.white,
              ),
              const Option(
                label: 'Black',
                value: ZeroColors.black,
              ),
              Option(
                label: 'Neutral 7',
                value: ZeroColors.neutral[7],
              ),
            ]),
            badgeColor: context.knobs.options(label: 'Badge Color', options: [
              Option(
                label: 'Primary 7',
                value: ZeroColors.primary[7],
              ),
              Option(
                label: 'Sunrise Yellow 7',
                value: ZeroColors.sunriseYellow[7],
              ),
              const Option(
                label: 'Success',
                value: ZeroColors.success,
              ),
              const Option(
                label: 'Danger',
                value: ZeroColors.danger,
              ),
            ]),
          ));
        }),
    WidgetbookUseCase(
        name: 'Avatar Group',
        builder: (context) {
          return Center(
            child: ZeroAvatarGroup(
              moreNumber: context.knobs.nullableNumber(
                label: 'More Count',
                initialValue: 1,
              ) as int,
              avatars:
                  context.knobs.options(label: 'List of Avatars', options: [
                Option(label: '3 Items', value: avatars.sublist(0, 2)),
                Option(label: '5 Items', value: avatars.sublist(0, 4)),
                Option(label: '7 Items', value: avatars.sublist(0, 6))
              ]),
            ),
          );
        }),
  ],
);
