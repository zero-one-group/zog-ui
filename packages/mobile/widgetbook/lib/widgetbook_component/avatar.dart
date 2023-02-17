import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

const String sampleUrl1 =
    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80';
const String sampleUrl2 =
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80';

List<ZeroAvatar> avatars = [
  ZeroAvatar.url(
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Wisnu',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Zuhlhijaya Zulhijaya',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Zuhlhijaya Zulhijaya',
    size: AvatarSize.xs,
  ),
];

List<Option<Color>> _initialColorOptions = [
  const Option(label: 'White', value: Colors.white),
  const Option(label: 'Red', value: Colors.red),
  const Option(label: 'Green', value: Colors.green),
  const Option(label: 'Blue', value: Colors.blue),
  const Option(label: 'Yellow', value: Colors.yellow),
  const Option(label: 'Black', value: Colors.black),
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
            initialColor: context.knobs.options(
                label: 'Initial Text Color', options: _initialColorOptions),
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
          return PreviewWidget(
            child: ZeroAvatarGroup(
              moreNumber: context.knobs.number(
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
