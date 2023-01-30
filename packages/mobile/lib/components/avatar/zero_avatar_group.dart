import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/components/avatar/zero_avatar.dart';
import 'package:zero_ui_mobile/types/avatar_size.dart';

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

  const ZeroAvatarGroup({super.key, required this.avatars, this.moreNumber});

  @override
  Widget build(BuildContext context) {
    List<Widget> smallAvatars = [];

    // Add more icon first
    if (moreNumber != null) {
      smallAvatars.add(Container(
        margin: EdgeInsets.only(
            left: (AvatarSize.m.areaWidth - overlappingWidth) *
                (avatars.length + 1)),
        child: _MoreAvatar(moreNumber: moreNumber!),
      ));
    }

    for (var i = avatars.reversed.length - 1; i >= 0; i--) {
      final avatar = avatars[i];
      smallAvatars.add(Container(
        margin: EdgeInsets.only(
                left: avatar.smallIcon.size.areaWidth - overlappingWidth) *
            (i + 1),
        child: avatar.smallIcon,
      ));
    }
    return Stack(
      children: smallAvatars,
    );
  }
}

class _MoreAvatar extends StatelessWidget {
  final int moreNumber;

  const _MoreAvatar({required this.moreNumber});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          ZeroColors.neutral6, // TODO: Make coloring more theme-able
      radius: AvatarSize.m.avatarRadius,
      child: Padding(
        padding: const EdgeInsets.only(left: overlappingWidth),
        child: Text('+$moreNumber',
            style: TextStyle(
                color: ZeroColors.white,
                fontSize: AvatarSize.m.fontSize,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
