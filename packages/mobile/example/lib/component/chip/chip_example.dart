import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroChipExample extends StatelessWidget {
  const ZeroChipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Chip Example'),
      ),
      body: Center(
          child: ListView(
        children: [
          ZeroListTile(
            title: 'Chip Filled',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const _Filled(),
                ),
              );
            },
          ),
          ZeroListTile(
            title: 'Chip Outlined',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const _Outlined(),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

class _Filled extends StatelessWidget {
  const _Filled();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Chip Filled Example'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Center(child: ZeroText.heading6('Large Chip')),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large',
              size: ZeroChipSize.large,
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large Cancellation',
              size: ZeroChipSize.large,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large Custom Cancel Icon',
              size: ZeroChipSize.large,
              cancelIcon: Icons.android,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large Avatar',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.initial(
                'WS',
                size: AvatarSize.xs,
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large Disabled',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              disabled: true,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Large Custom Style',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              style: const ZeroChipFilledStyle(
                backgroundColor: Colors.blue,
                iconColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            const ZeroDivider.horizontal(
              style: ZeroDividerStyle(size: 4),
            ),

            // start example small chip
            const SizedBox(height: 24),
            const Center(child: ZeroText.heading6('Small Chip')),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Small',
              size: ZeroChipSize.small,
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Small Cancellation',
              size: ZeroChipSize.small,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Small Custom Cancel Icon',
              size: ZeroChipSize.small,
              cancelIcon: Icons.android,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Small Disabled',
              size: ZeroChipSize.small,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              disabled: true,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipFilled(
              onTap: () {},
              label: 'Chip Small Custom Style',
              size: ZeroChipSize.small,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              style: const ZeroChipFilledStyle(
                backgroundColor: Colors.blue,
                iconColor: Colors.white,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _Outlined extends StatelessWidget {
  const _Outlined();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Chip Outlined Example'),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Center(child: ZeroText.heading6('Large Chip')),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large',
              size: ZeroChipSize.large,
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large Cancellation',
              size: ZeroChipSize.large,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large Custom Cancel Icon',
              size: ZeroChipSize.large,
              cancelIcon: Icons.android,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large Avatar',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.initial(
                'WS',
                size: AvatarSize.xs,
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large Disabled',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              disabled: true,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Large Custom Style',
              size: ZeroChipSize.large,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              style: const ZeroChipOutlinedStyle(
                borderColor: Colors.blue,
                iconColor: Colors.green,
                textStyle: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            const ZeroDivider.horizontal(
              style: ZeroDividerStyle(size: 4),
            ),

            // start example small chip
            const SizedBox(height: 24),
            const Center(child: ZeroText.heading6('Small Chip')),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Small',
              size: ZeroChipSize.small,
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Small Cancellation',
              size: ZeroChipSize.small,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Small Custom Cancel Icon',
              size: ZeroChipSize.small,
              cancelIcon: Icons.android,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Small Disabled',
              size: ZeroChipSize.small,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              disabled: true,
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
            ZeroChipOutlined(
              onTap: () {},
              label: 'Chip Small Custom Style',
              size: ZeroChipSize.small,
              avatar: const ZeroAvatar.url(
                'https://shorturl.at/dknSY',
                size: AvatarSize.xs,
              ),
              style: const ZeroChipOutlinedStyle(
                borderColor: Colors.blue,
                iconColor: Colors.green,
                textStyle: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTapCancel: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
