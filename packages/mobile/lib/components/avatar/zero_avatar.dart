import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum SourceType {
  url,
  file,
  asset,
  noSource // Only apply when `initials` of `AvatarVariant` is chosen
}

enum AvatarVariant { image, initials }

class ZeroAvatar extends StatelessWidget {
  final String? url;

  /// The user's full name text to get the initial from
  final String? fullName;

  /// From URL, file, or asset
  final SourceType type;

  /// Can be image or initial characters
  final AvatarVariant variant;

  /// Size of avatar, ranging from [AvatarSize.xxs] to [AvatarSize.xxl]
  /// Diameter values: 16, 24, 32, 48, 64, 96, 128
  /// Default value: [AvatarSize.l]
  final AvatarSize size;

  final bool withBadge;

  /// Can be [Text], [Icon], etc.
  final Widget? badgeChild;

  /// Allow to custom style of this [avatar]
  final ZeroAvatarStyle? style;

  const ZeroAvatar._({
    this.url,
    this.size = AvatarSize.l,
    this.withBadge = false,
    this.style,
    this.badgeChild,
    this.fullName,
    required this.type,
    required this.variant,
  });

  /// Create avatar from URL
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  const ZeroAvatar.url(
    String avatarUrl, {
    super.key,
    this.size = AvatarSize.l,
    this.withBadge = false,
    this.style,
    this.badgeChild,
  })  : url = avatarUrl,
        variant = AvatarVariant.image,
        fullName = null,
        type = SourceType.url;

  /// Create avatar from [File]
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  const ZeroAvatar.file(
    String avatarFile, {
    super.key,
    this.size = AvatarSize.l,
    this.withBadge = false,
    this.style,
    this.badgeChild,
  })  : variant = AvatarVariant.image,
        url = avatarFile,
        fullName = null,
        type = SourceType.file;

  /// Create avatar from asset
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  const ZeroAvatar.asset(
    String avatarAsset, {
    super.key,
    this.size = AvatarSize.l,
    this.withBadge = false,
    this.style,
    this.badgeChild,
  })  : variant = AvatarVariant.image,
        url = avatarAsset,
        fullName = null,
        type = SourceType.asset;

  /// Create avatar from full name text that only shows its initial
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  const ZeroAvatar.initial(
    String name, {
    super.key,
    this.size = AvatarSize.l,
    this.withBadge = false,
    this.style,
    this.badgeChild,
  })  : variant = AvatarVariant.initials,
        url = null,
        fullName = name,
        type = SourceType.noSource;

  /// Change the size of avatar
  /// Typically as the children of [ZeroAvatarGroup]
  ZeroAvatar changeSize(AvatarSize size) {
    return ZeroAvatar._(
      fullName: fullName,
      size: size,
      withBadge: false,
      type: type,
      badgeChild: badgeChild,
      variant: variant,
      style: style,
      url: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.avatarStyle;
    final adaptiveStyle = themeStyle.merge(style);

    ImageProvider? backgroundImage;
    switch (type) {
      case SourceType.url:
        backgroundImage = NetworkImage(url!);
        break;
      case SourceType.file:
        backgroundImage = FileImage(File(url!));
        break;
      case SourceType.asset:
        backgroundImage = AssetImage(url!);
        break;
      case SourceType.noSource:
        break;
    }

    return SizedBox(
      width: size.areaWidth,
      height: size.areaWidth,
      child: Stack(
        children: [
          variant == AvatarVariant.image
              ? CircleAvatar(
                  backgroundColor: adaptiveStyle.borderColor,
                  radius: size.areaWidth / 2,
                  child: CircleAvatar(
                    backgroundColor: adaptiveStyle.backgroundColor,
                    backgroundImage: backgroundImage,
                    radius: size.avatarRadius,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: adaptiveStyle.borderColor,
                  radius: size.areaWidth / 2,
                  child: CircleAvatar(
                    backgroundColor: adaptiveStyle.backgroundColor,
                    radius: size.avatarRadius,
                    child: Text(_getinitials(fullName!),
                        style: TextStyle(
                                color: adaptiveStyle.initialColor,
                                fontSize: size.fontSize,
                                fontWeight: FontWeight.w500)
                            .merge(adaptiveStyle.initialStyle)),
                  )),
          if (withBadge)
            Align(
              alignment: Alignment.bottomRight,
              child: badgeChild ??
                  CircleAvatar(
                    backgroundColor: adaptiveStyle.borderColor,
                    radius: size.badgeRadius,
                    child: CircleAvatar(
                      backgroundColor: adaptiveStyle.badgeColor,
                      radius: size.badgeRadius - (size.badgeRadius / 3),
                    ),
                  ),
            )
        ],
      ),
    );
  }

  /// Method for converting the full name text to 2 chars of initial
  /// Example: Given string 'Muhammad R Kahfi', then it returns 'MR'
  String _getinitials(String text) {
    String result = "";
    List<String> words = text.split(" ");
    for (var element in words) {
      if (element.trim().isNotEmpty && result.length < 2) {
        result += element[0].trim();
      }
    }

    return result.trim().toUpperCase();
  }
}
