import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/avatar/zero_avatar.dart';
import 'package:zero_ui_mobile/components/avatar/zero_avatar_group.dart';
import 'package:zero_ui_mobile/types/avatar_size.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? checkValue;
  String optionValue = '';
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6'
    ];
    List<String> labels = ['Search', 'Alarm', 'Calendar'];
    List<IconData> icons = [Icons.search, Icons.alarm, Icons.calendar_month];
    List<bool> isSelected = [false, false, false];
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      // Checkbox(
      //   tristate: true,
      //   value: checkValue,
      //   onChanged: (val) {
      //     setState(() {
      //       checkValue = val;
      //     });
      //   },
      // ),

      ZeroButton.text(
        text: 'Button Text',
        onPressed: () {},
        buttonRadiusType: ZeroButtonRadiusType.curved,
        buttonSizeType: ZeroSizeType.small,
        isDisabled: false,
        width: 180,
        height: 60,
      ),

      ZeroCheckbox(
        tristate: true,
        value: true,
        onChanged: (val) {
          log(val.toString());
        },
        size: ZeroSizeType.medium,
        isDisabled: true,
      ),

      // ZeroRadio.custom(
      //   value: '1',
      //   groupValue: optionValue,
      //   onChanged: (value) {
      //     log(value.toString());
      //     setState(() {
      //       optionValue = value.toString();
      //     });
      //   },
      //   activeColor: ZeroColors.success,
      //   isDisabled: false,
      //   size: ZeroSizeType.medium,
      // ),

      ZeroRadioGroup(
        value: '1',
        groupValue: optionValue,
        onChanged: (value) {
          log(value.toString());
          setState(() {
            optionValue = value.toString();
          });
        },
        activeColor: ZeroColors.primary9,
        isDisabled: false,
        size: ZeroSizeType.medium,
        customSelected: true,
      ),
      const SizedBox(height: 10),
      ZeroRadioGroup(
        value: '2',
        groupValue: optionValue,
        onChanged: (value) {
          log(value.toString());
          setState(() {
            optionValue = value.toString();
          });
        },
        isDisabled: false,
        size: ZeroSizeType.medium,
      ),

      Radio(
        fillColor: MaterialStateProperty.all(ZeroColors.danger),
        value: '2',
        groupValue: optionValue,
        onChanged: (value) {
          log(value.toString());
          setState(() {
            optionValue = value.toString();
          });
        },
      ),

      ZeroButtonIcon.text(
        icon: const Icon(Icons.search),
        onPressed: () {},
        buttonRadiusType: ZeroButtonRadiusType.curved,
        buttonSizeType: ZeroSizeType.medium,
        isDisabled: false,
      ),

      ZeroButtonLIcon.text(
        icon: const Icon(Icons.search),
        onPressed: () {},
        buttonRadiusType: ZeroButtonRadiusType.rounded,
        buttonSizeType: ZeroSizeType.small,
        isDisabled: true,
        height: 50,
        text: 'Button Text',
      ),

      ZeroButtonRIcon.text(
        icon: const Icon(Icons.search),
        onPressed: () {},
        buttonRadiusType: ZeroButtonRadiusType.rounded,
        buttonSizeType: ZeroSizeType.large,
        isDisabled: false,
        height: 60,
        text: 'Button Text',
      ),

      ZeroButtonRLIcon.text(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.search),
        onPressed: () {},
        buttonRadiusType: ZeroButtonRadiusType.rounded,
        buttonSizeType: ZeroSizeType.large,
        isDisabled: false,
        width: 250,
        height: 60,
        text: 'Button Text',
      ),

      ZeroTooltip(
        type: ZeroTooltipType.dark,
        position: ZeroTooltipPosition.bottom,
        variant: ZeroTooltipVariant.rounded,
        text: 'text',
        child: Container(
          height: 50,
          width: 80,
          color: Colors.red,
        ),
      ),

      // ZeroRating(
      //   itemCount: 5,
      //   spacing: 5,
      //   minValue: 1,
      //   initialValue: 3,
      //   allowHalfRating: true,
      //   sizeType: ZeroSizeType.large,
      //   isDisabled: false,
      //   ratingWidget: RatingWidget(
      //     full: const Icon(
      //       Icons.star,
      //       color: Colors.amber,
      //     ),
      //     half: const Icon(
      //       Icons.star,
      //       color: Colors.yellow,
      //     ),
      //     empty: const Icon(
      //       Icons.star,
      //       color: Colors.black12,
      //     ),
      //   ),
      //   onRatingUpdate: (val) {},
      // ),
      // const SizedBox(height: 20),
      ZeroRatingCustom(
        spacing: 4,
        initialValue: 1,
        isDisabled: false,
        inactiveColor: ZeroColors.neutral7,
        sizeType: ZeroSizeType.small,
        onRatingUpdate: (val) {
          log(val.toString());
        },
        listItems: const [
          Icon(Icons.star, color: ZeroColors.danger),
          Icon(Icons.place, color: ZeroColors.sunriseYellow6),
          Icon(Icons.flag, color: ZeroColors.success),
        ],
      ),

      const SizedBox(height: 32),
      const ZeroBadge(
        type: ZeroBadgeType.dot,
        child: Icon(Icons.ac_unit),
      ),
      const SizedBox(height: 32),
      ZeroListTile(
        title: 'Title Text',
        subtitle: 'Subtitle Text',
        rightIcon: const Icon(Icons.navigate_next),
        leftIcon: const Icon(Icons.air),
        onTap: () {},
      ),
      const SizedBox(height: 32),

      // ZeroRating(
      //   itemCount: 5,
      //   spacing: 5,
      //   minValue: 1,
      //   initialValue: 3,
      //   allowHalfRating: true,
      //   sizeType: ZeroSizeType.large,
      //   isDisabled: false,
      //   ratingWidget: RatingWidget(
      //     full: const Icon(
      //       Icons.star,
      //       color: Colors.amber,
      //     ),
      //     half: const Icon(
      //       Icons.star,
      //       color: Colors.yellow,
      //     ),
      //     empty: const Icon(
      //       Icons.star,
      //       color: Colors.black12,
      //     ),
      //   ),
      //   onRatingUpdate: (val) {},
      // ),
      // const SizedBox(height: 20),

      ZeroRatingCustom(
        spacing: 4,
        initialValue: 1,
        isDisabled: false,
        inactiveColor: ZeroColors.neutral7,
        sizeType: ZeroSizeType.small,
        onRatingUpdate: (val) {
          log(val.toString());
        },
        listItems: const [
          Icon(Icons.star, color: ZeroColors.danger),
          Icon(Icons.place, color: ZeroColors.sunriseYellow6),
          Icon(Icons.flag, color: ZeroColors.success),
        ],
      ),

      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ZeroDropdown<String>(
            labelText: 'Label Text',
            hintText: 'Hint Text',
            value: items.first,
            items: items,
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.search),
            ),
            inputDecorationType: InputDecorationType.outline,
            onChanged: (value) {},
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ZeroDropdown<String>(
            labelText: 'Label Text',
            hintText: 'Hint Text',
            value: items.first,
            items: items,
            inputDecorationType: InputDecorationType.underline,
            onChanged: (value) {},
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ZeroDropdown<String>(
            labelText: 'Label Text',
            hintText: 'Hint Text',
            value: items.first,
            items: items,
            inputDecorationType: InputDecorationType.outline,
            onChanged: (value) {},
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ZeroDropdown<String>.multiple(
            labelText: 'Label Text',
            hintText: 'Hint Text',
            value: items.first,
            items: items,
            inputDecorationType: InputDecorationType.outline,
            selectedItemsStyle: SelectedItemsStyle.chipInverted,
            enableMultipleItems: true,
            multipleItemsVariant: MultipleItemsVariant.checkboxes,
            onChanged: (value) {},
          )),
      ZeroButtonGroup.labelsWithIcons(
        labels: labels,
        icons: icons,
        buttonSizeType: ZeroSizeType.large,
        isSelected: isSelected,
      ),
      ZeroButtonGroup.labelsWithIcons(
        labels: labels,
        buttonSizeType: ZeroSizeType.large,
        icons: icons,
        vertical: true,
        isSelected: isSelected,
      ),
      ZeroButtonGroup.iconsOnly(
        icons: icons,
        isSelected: isSelected,
      ),
      ZeroButtonGroup.iconsOnly(
        icons: icons,
        vertical: true,
        isSelected: isSelected,
        square: true,
      ),
      const SizedBox(height: 32),
      const ZeroBadge(
        type: ZeroBadgeType.dot,
        child: Icon(Icons.ac_unit),
      ),
      const SizedBox(height: 32),
      ZeroListTile(
        title: 'Title Text',
        subtitle: 'Subtitle Text',
        rightIcon: const Icon(Icons.navigate_next),
        leftIcon: const Icon(Icons.air),
        onTap: () {},
      ),
      const SizedBox(height: 32),
      const ZeroText.heading5('Heading 5'),
      const ZeroText.heading6('Heading 6'),
      const ZeroText.subtitle1('Subtitle 1'),
      const ZeroText.subtitle2('Subtitle 2'),
      const ZeroText.body1('Body 1'),
      const ZeroText.body2('Body 2'),
      const ZeroText.button('Button'),
      const ZeroText.caption('Caption'),
      const ZeroText.overline('Overline'),
      const SizedBox(height: 32),

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.xxs,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.xs,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.s,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.m,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            withBadge: true,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.xl,
            withBadge: true,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.xxl,
            withBadge: true,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.initial(
            'Muhammad Rijalul Kahfi',
            size: AvatarSize.xxl,
            withBadge: true,
          ),
          const SizedBox(
            width: 10,
          ),
          ZeroAvatar.url(
            'https://shorturl.at/dknSY',
            size: AvatarSize.xxl,
            badgeColor: Colors.transparent,
            withBadge: true,
            badgeChild: const Icon(
              Icons.check_circle,
              size: 48,
              color: ZeroColors.success,
            ),
          ),
        ]),
      ),
      const SizedBox(
        height: 32,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ZeroAvatarGroup(moreNumber: 1000, avatars: [
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
              'Muhammad R Kahfi',
              size: AvatarSize.xs,
            ),
            ZeroAvatar.url(
              'https://shorturl.at/dknSY',
              size: AvatarSize.xs,
            ),
            ZeroAvatar.initial(
              'Muhammad R Kahfi',
              size: AvatarSize.xs,
            ),
          ])),
    ])));
  }
}
