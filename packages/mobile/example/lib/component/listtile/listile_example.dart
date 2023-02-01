import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroListTileExample extends StatelessWidget {
  const ZeroListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero List Tile Example'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          ZeroListTile(
            title: 'List Tile without subtitle',
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile with Description',
            subtitle: 'Subtitle text',
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile with Description',
            subtitle: 'Subtitle text',
            leftIcon: const Icon(Icons.person),
            rightIcon: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile small',
            subtitle: 'Subtitle text',
            size: ZeroListTileSize.small,
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile divider',
            subtitle: 'Subtitle text',
            withDivider: true,
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile disabled',
            subtitle: 'Subtitle text',
            disabled: true,
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile selected',
            subtitle: 'Subtitle text',
            withDivider: true,
            selected: true,
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile custom',
            subtitle: 'Subtitle text',
            withDivider: true,
            style: const ZeroListTileStyle(
              selectedColor: Colors.red,
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(color: Colors.white),
              subTitleTextStyle: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ZeroListTile(
            title: 'List Tile Slidable',
            subtitle: 'Subtitle text',
            withDivider: true,
            onTap: () {},
            startSlideActions: [
              ZeroListTileAction(
                label: 'Share',
                icon: Icons.share,
                backgroundColor: context.theme.primaryColor.normal,
                foregroundColor: Colors.white,
              ),
              ZeroListTileAction(
                label: 'Archive',
                icon: Icons.archive,
                backgroundColor: context.theme.primaryColor.dark,
                foregroundColor: Colors.white,
              ),
            ],
            endSlideActions: [
              ZeroListTileAction(
                label: 'Delete',
                icon: CupertinoIcons.delete_solid,
                backgroundColor: context.theme.errorColor,
                foregroundColor: Colors.white,
              ),
              const ZeroListTileAction(
                label: 'More',
                icon: Icons.more_horiz,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
