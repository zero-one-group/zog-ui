import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationDrawerExample extends StatelessWidget {
  const ZeroNavigationDrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Navigation Drawer Example'),
      ),
      drawer: ZeroNavigationDrawer(
        header: ZeroNavigationDrawerHeader(
          child: Image.network(
            'https://i0.wp.com/www.globalemancipation.ngo/wp-content/uploads/2017/09/github-logo.png?ssl=1',
            height: 32,
          ),
        ),
        children: [
          ZeroNavigationDrawerSection(
            title: const Text('Section Header'),
            menus: [
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.alert),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.api),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.aim),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.clear),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
            ],
          ),
          ZeroNavigationDrawerSection(
            title: const Text('Section Header'),
            menus: [
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.alert),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.api),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.aim),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                leftIcon: const Icon(ZeroIcons.clear),
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
            ],
          ),
          ZeroNavigationDrawerSection(
            title: const Text('Section Header'),
            menus: [
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
            ],
          ),
          ZeroNavigationDrawerSection(
            title: const Text('Section Header'),
            menus: [
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
              ZeroListTile(
                title: 'List Item',
                rightIcon: const Text('100+'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
