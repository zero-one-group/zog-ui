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
  final String? file;
  final String? asset;

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

  /// backgroundColor of the avatar when no image
  final Color? backgroundColor;

  /// backgroundColor of the badge when no child
  final Color? badgeColor;

  /// Can be [Text], [Icon], etc.
  final Widget? badgeChild;

  /// text Color of the initials
  final Color? initialColor;

  /// [TextStyle] of initial text
  final TextStyle? initialStyle;

  const ZeroAvatar._(
      {Key? key,
      this.url,
      this.file,
      this.asset,
      this.fullName,
      required this.type,
      required this.size,
      required this.withBadge,
      required this.variant,
      this.badgeColor,
      this.initialColor,
      this.badgeChild,
      this.backgroundColor,
      this.initialStyle});

  /// Create avatar from URL
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  factory ZeroAvatar.url(String url,
          {Key? key,
          AvatarSize? size,
          bool? withBadge,
          Color? badgeColor,
          Color? backgroundColor,
          Widget? badgeChild}) =>
      ZeroAvatar._(
        key: key,
        url: url,
        size: size ?? AvatarSize.l,
        type: SourceType.url,
        withBadge: withBadge ?? false,
        variant: AvatarVariant.image,
        badgeColor: badgeColor,
        backgroundColor: backgroundColor,
        badgeChild: badgeChild,
      );

  /// Create avatar from [File]
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  factory ZeroAvatar.file(
    String file, {
    Key? key,
    AvatarSize? size,
    bool? withBadge,
    Color? badgeColor,
    Color? backgroundColor,
    Widget? badgeChild,
  }) =>
      ZeroAvatar._(
        file: file,
        size: size ?? AvatarSize.l,
        type: SourceType.url,
        withBadge: withBadge ?? false,
        badgeColor: badgeColor,
        backgroundColor: backgroundColor,
        badgeChild: badgeChild,
        variant: AvatarVariant.image,
      );

  /// Create avatar from asset
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  factory ZeroAvatar.asset(
          {Key? key,
          required String asset,
          AvatarSize? size,
          bool? withBadge,
          Color? badgeColor,
          Color? backgroundColor,
          Widget? badgeChild}) =>
      ZeroAvatar._(
        asset: asset,
        size: size ?? AvatarSize.l,
        type: SourceType.url,
        withBadge: withBadge ?? false,
        badgeColor: badgeColor,
        backgroundColor: backgroundColor,
        badgeChild: badgeChild,
        variant: AvatarVariant.image,
      );

  /// Create avatar from full name text that only shows its initial
  /// Default values:
  ///   size = [AvatarSize.l]
  ///   withBadge = false
  factory ZeroAvatar.initial(String fullName,
          {Key? key,
          AvatarSize? size,
          bool? withBadge,
          Color? badgeColor,
          Color? backgroundColor,
          Color? initialColor,
          Widget? badgeChild,
          TextStyle? initialStyle}) =>
      ZeroAvatar._(
        fullName: fullName,
        size: size ?? AvatarSize.l,
        type: SourceType.noSource,
        withBadge: withBadge ?? false,
        badgeColor: badgeColor,
        backgroundColor: backgroundColor,
        badgeChild: badgeChild,
        variant: AvatarVariant.initials,
        initialColor: initialColor,
        initialStyle: initialStyle,
      );

  /// Get smallIcon with size [AvatarSize.m]
  /// Typically as the children of [ZeroAvatarGroup]
  ZeroAvatar get smallIcon {
    return ZeroAvatar._(
      fullName: fullName,
      size: AvatarSize.m,
      url: url,
      asset: asset,
      file: file,
      type: type,
      withBadge: false,
      badgeColor: badgeColor,
      backgroundColor: backgroundColor,
      badgeChild: badgeChild,
      variant: variant,
      initialColor: initialColor,
      initialStyle: initialStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider? backgroundImage;
    switch (type) {
      case SourceType.url:
        backgroundImage = NetworkImage(url!);
        break;
      case SourceType.file:
        backgroundImage = FileImage(File(file!));
        break;
      case SourceType.asset:
        backgroundImage = AssetImage(asset!);
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
                  backgroundColor: Colors.white,
                  radius: size.areaWidth / 2,
                  child: CircleAvatar(
                    backgroundColor: backgroundColor,
                    backgroundImage: backgroundImage,
                    radius: size.avatarRadius,
                  ),
                )
              : CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: size.areaWidth / 2,
                  child: CircleAvatar(
                    backgroundColor: backgroundColor,
                    radius: size.avatarRadius,
                    child: Text(_getinitials(fullName!),
                        style: TextStyle(
                                color: initialColor,
                                fontSize: size.fontSize,
                                fontWeight: FontWeight.w500)
                            .merge(initialStyle)),
                  )),
          if (withBadge)
            Align(
              alignment: Alignment.bottomRight,
              child: badgeChild ??
                  CircleAvatar(
                    backgroundColor: ZeroColors.white,
                    radius: size.badgeRadius,
                    child: CircleAvatar(
                      backgroundColor: badgeColor,
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
