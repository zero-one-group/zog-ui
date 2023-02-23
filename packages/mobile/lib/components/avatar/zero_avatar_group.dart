import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// The overlapping distance between icons
const double overlappingWidth = 10.0;

/// The group containing a horizontal list of [ZeroAvatar] widgets
/// You just need to have a set of existing [ZeroAvatar]'s instances
/// and this widget will form the small icons for you out-of-the box
///
/// Currently this will show all the avatars provided in `avatars` field
/// So you have to limit the number of [ZeroAvatar] widgets yourself.
///
/// TODO: To make this limit automatic according to the width of the parent widget
///  and the `moreNumber` set accordingly without having to set it on the parameter
class ZeroAvatarGroup extends StatelessWidget {
  /// List of the [ZeroAvatars]
  final List<ZeroAvatar> avatars;

  /// Number indicating more avatars count.
  /// Example: given value of 3, then it would be +3, 10 would be +10, etc
  final int? moreNumber;

  final AvatarSize size;

  /// Style for more avatar widgets
  final ZeroAvatarStyle? moreAvatarStyle;

  const ZeroAvatarGroup({
    super.key,
    required this.avatars,
    this.moreNumber,
    this.size = AvatarSize.m,
    this.moreAvatarStyle,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.avatarStyle.copyWith(
      backgroundColor: context.theme.regularTextColor,
    );

    final adaptiveStyle = themeStyle.merge(moreAvatarStyle);

    List<Widget> smallAvatars = [];

    // Add more icon first
    if (moreNumber != null) {
      smallAvatars.add(Container(
        margin: EdgeInsets.only(
            left: (size.areaWidth - overlappingWidth) * (avatars.length + 1)),
        child: _MoreAvatar(
          moreNumber: moreNumber!,
          size: size,
          style: adaptiveStyle,
        ),
      ));
    }

    for (var i = avatars.reversed.length - 1; i >= 0; i--) {
      final avatar = avatars[i];
      smallAvatars.add(
        Container(
          margin: EdgeInsets.only(left: size.areaWidth - overlappingWidth) *
              (i + 1),
          child: avatar.changeSize(size),
        ),
      );
    }

    return Stack(
      children: smallAvatars,
    );
  }
}

class _MoreAvatar extends StatelessWidget {
  final int moreNumber;
  final ZeroAvatarStyle style;
  final AvatarSize size;

  const _MoreAvatar({
    required this.moreNumber,
    required this.style,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.avatarDiameter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.avatarRadius),
          color: style.backgroundColor),
      constraints: BoxConstraints(
        minWidth: size.avatarDiameter,
        maxHeight: size.avatarDiameter,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.avatarRadius / 3),
            child: Text(
              '+${moreNumber.kmbFormat}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: style.initialColor,
                fontSize: size.fontSize,
                fontWeight: FontWeight.w500,
              ).merge(style.initialStyle),
            ),
          ),
        ],
      ),
    );
  }
}
