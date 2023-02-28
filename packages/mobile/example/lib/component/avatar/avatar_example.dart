import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAvatarExample extends StatelessWidget {
  const ZeroAvatarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Avatar Example'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: ZeroAvatarGroup(
                moreNumber: 1000,
                avatars: _items,
                size: AvatarSize.xxs,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: ZeroAvatarGroup(
                size: AvatarSize.xs,
                moreNumber: 1000,
                avatars: _items,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: ZeroAvatarGroup(
                size: AvatarSize.s,
                moreNumber: 1000,
                avatars: _items,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: ZeroAvatarGroup(
                size: AvatarSize.m,
                moreNumber: 1000,
                avatars: _items,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: ZeroAvatarGroup(
                moreAvatarStyle: ZeroAvatarStyle(
                  backgroundColor: Colors.yellow,
                  initialColor: Colors.cyan,
                ),
                moreNumber: 1000,
                avatars: _items,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _items = [
  ZeroAvatar.url(
    'https://s.id/1Ad0k',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://s.id/1Ad0k',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.url(
    'https://s.id/1Ad0k',
    size: AvatarSize.xs,
  ),
  ZeroAvatar.initial(
    'Muhammad R Kahfi',
    size: AvatarSize.xs,
  ),
];
