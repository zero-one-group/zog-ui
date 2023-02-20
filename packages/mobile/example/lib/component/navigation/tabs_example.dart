import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroTabsExample extends StatelessWidget {
  const ZeroTabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero Tabs Example'),
      ),
      body: ListView(
        children: [
          ZeroListTile(
            title: 'Basic',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const _Basic()),
              );
            },
          ),
          ZeroListTile(
            title: 'Scrollable',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const _Scrollable()),
              );
            },
          ),
          ZeroListTile(
            title: 'Custom Style',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const _CustomStyle()),
              );
            },
          )
        ],
      ),
    );
  }
}

class _Basic extends StatelessWidget {
  const _Basic();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Basic'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kZeroTabBarDefaultHeight),
            child: ZeroTabBar(
              tabs: [
                ZeroTab(
                  label: Text('HOME'),
                  icon: Icon(ZeroIcons.home),
                ),
                ZeroTab(
                  label: Text('NOTIF'),
                  icon: Icon(ZeroIcons.notification),
                ),
                ZeroTab(
                  label: Text('PROFILE'),
                  icon: Icon(ZeroIcons.user),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Scrollable extends StatelessWidget {
  const _Scrollable();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Scrollable'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kZeroTabBarDefaultHeight),
            child: ZeroTabBar(
              style: ZeroTabBarStyle(
                isScrollable: true,
              ),
              tabs: [
                ZeroTab(
                  label: Text('HOME'),
                  icon: Icon(ZeroIcons.home),
                ),
                ZeroTab(
                  label: Text('NOTIF'),
                  icon: Icon(ZeroIcons.notification),
                ),
                ZeroTab(
                  label: Text('CONFIG'),
                  icon: Icon(ZeroIcons.macCommand),
                ),
                ZeroTab(
                  label: Text('PROFILE'),
                  icon: Icon(ZeroIcons.user),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomStyle extends StatelessWidget {
  const _CustomStyle();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ZeroAppBar(
          title: const Text('Custom Style'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(kZeroTabBarDefaultHeight),
            child: ZeroTabBar(
              style: ZeroTabBarStyle(
                isScrollable: true,
                activeColor: Colors.pink,
                inactiveColor: Colors.yellow,
                indicatorColor: Colors.blue,
                backgroundColor: Colors.green,
              ),
              tabs: [
                ZeroTab(
                  label: Text('HOME'),
                  icon: Icon(ZeroIcons.home),
                ),
                ZeroTab(
                  label: Text('NOTIF'),
                  icon: Icon(ZeroIcons.notification),
                ),
                ZeroTab(
                  label: Text('CONFIG'),
                  icon: Icon(ZeroIcons.macCommand),
                ),
                ZeroTab(
                  label: Text('PROFILE'),
                  icon: Icon(ZeroIcons.user),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
