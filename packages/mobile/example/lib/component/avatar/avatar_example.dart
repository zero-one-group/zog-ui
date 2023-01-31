import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroAvatarExample extends StatelessWidget {
  const ZeroAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Avatar Example'),
      ),
      body: ListView(
        children: [
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
              ]))
        ],
      ),
    );
  }
}
