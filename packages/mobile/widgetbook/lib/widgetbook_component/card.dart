import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';
import '../options/options.dart';
import '../utils.dart';

WidgetbookComponent cardWidgetbookComponent = WidgetbookComponent(
  name: 'Card',
  useCases: [
    WidgetbookUseCase(
      name: 'Card Horizontal',
      builder: (context) {
        ZeroAvatar? avatar;
        AvatarSize avatarSize = context.knobs.options(
          label: 'Avatar Size',
          options: _avatarSizes,
        );
        if (context.knobs.boolean(label: 'Avatar', initialValue: true)) {
          avatar = ZeroAvatar.url(
            'https://picsum.photos/100',
            size: avatarSize,
          );
        }

        Image? image;
        if (context.knobs.boolean(label: 'Image', initialValue: true)) {
          image = Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.cover,
            width: 100,
          );
        }

        return PreviewWidget(
          child: ZeroCard(
            header: context.knobs.text(label: 'Header', initialValue: 'Header'),
            subheader: context.knobs.text(label: 'Subheader', initialValue: 'Subheader'),
            title: context.knobs.text(label: 'Title', initialValue: 'Title'),
            subtitle: context.knobs.text(label: 'Subtitle', initialValue: 'Subtitle'),
            description: context.knobs.text(
              label: 'Description',
              initialValue: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
            ),
            variant: context.knobs.options(
              label: 'Variant',
              options: _variants,
            ),
            avatar: avatar,
            image: image,
            headerTrailing:
                context.knobs.boolean(label: 'Header Trailing', initialValue: true) ? const Icon(Icons.more_vert) : null,
            actions: [
              ZeroButton.secondary(
                text: 'Cancel',
                onPressed: () {},
                height: 35,
                buttonSizeType: ZeroSizeType.small,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                style: const ZeroButtonStyle(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                ),
              ),
              ZeroButton.primary(
                text: 'OK',
                onPressed: () {},
                height: 35,
                buttonSizeType: ZeroSizeType.small,
                buttonRadiusType: ZeroButtonRadiusType.rounded,
                style: const ZeroButtonStyle(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                ),
              ),
            ],
            width: context.knobs.number(label: 'Width', initialValue: 300).toDouble(),
            filledColor: context.knobs.options(label: 'Filled Color', options: [
              const Option(value: ZeroColors.white, label: 'White'),
              ...colorOptions,
            ]),
            outlineBorderColor: context.knobs.options(label: 'Outline Border Color', options: [
              const Option(value: ZeroColors.black, label: 'Black'),
              ...colorOptions,
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Card Vertical',
      builder: (context) {
        ZeroAvatar? avatar;
        AvatarSize avatarSize = context.knobs.options(
          label: 'Avatar Size',
          options: _avatarSizes,
        );
        if (context.knobs.boolean(label: 'Avatar', initialValue: true)) {
          avatar = ZeroAvatar.url(
            'https://picsum.photos/100',
            size: avatarSize,
          );
        }

        Image? image;
        if (context.knobs.boolean(label: 'Image', initialValue: true)) {
          image = Image.network(
            'https://picsum.photos/200',
            fit: BoxFit.cover,
            width: 100,
          );
        }

        return PreviewWidget(
          child: ZeroCardVertical(
            header: context.knobs.text(label: 'Header', initialValue: 'Header'),
            subheader: context.knobs.text(label: 'Subheader', initialValue: 'Subheader'),
            variant: context.knobs.options(
              label: 'Variant',
              options: _variants,
            ),
            avatar: avatar,
            image: image,
            height: context.knobs.number(label: 'Height', initialValue: 80).toDouble(),
            width: context.knobs.number(label: 'Width', initialValue: 300).toDouble(),
            filledColor: context.knobs.options(label: 'Filled Color', options: [
              const Option(value: ZeroColors.white, label: 'White'),
              ...colorOptions,
            ]),
            outlineBorderColor: context.knobs.options(label: 'Outline Border Color', options: [
              const Option(value: ZeroColors.black, label: 'Black'),
              ...colorOptions,
            ]),
          ),
        );
      },
    ),
  ],
);

List<Option<ZeroCardVariant>> _variants = [
  const Option(value: ZeroCardVariant.elevated, label: 'Eleveated'),
  const Option(value: ZeroCardVariant.outline, label: 'Outline'),
  const Option(value: ZeroCardVariant.filled, label: 'Filled'),
];

List<Option<AvatarSize>> _avatarSizes = [
  const Option(value: AvatarSize.xs, label: 'Extra Small'),
  const Option(value: AvatarSize.s, label: 'Small'),
  const Option(value: AvatarSize.m, label: 'Medium'),
  const Option(value: AvatarSize.l, label: 'Large'),
  const Option(value: AvatarSize.xl, label: 'Extra Large'),
];
