import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationBarExample extends StatelessWidget {
  const ZeroNavigationBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Navigation Bar Example'),
      ),
      body: ListView(
        children: [
          ZeroListTile(
            title: 'Default',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const _Default()));
            },
          ),
          ZeroListTile(
            title: 'Adaptive Icon',
            subtitle: 'Active and Inactive different icon',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const _AdaptiveIcon()));
            },
          ),
          ZeroListTile(
            title: 'Label on Active',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const _DynamicLabel()));
            },
          ),
          ZeroListTile(
            title: 'Custom Style',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const _CustomStyle()));
            },
          ),
        ],
      ),
    );
  }
}

class _Default extends StatelessWidget {
  const _Default();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Default'),
      ),
      backgroundColor: Colors.green.shade100,
      bottomNavigationBar: const _ZeroNavigationBarBuilder(
        items: [
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.home),
            label: 'Home',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.notification),
            label: 'Notif',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.message),
            label: 'Message',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.fire),
            label: 'More',
          ),
        ],
        type: ZeroNavigationBarType.iconLabel,
        style: ZeroNavigationBarStyle(),
      ),
    );
  }
}

class _AdaptiveIcon extends StatelessWidget {
  const _AdaptiveIcon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Icon'),
      ),
      backgroundColor: Colors.green.shade100,
      bottomNavigationBar: const _ZeroNavigationBarBuilder(
        items: [
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.home),
            activeIcon: Icon(ZeroIcons.homeFilled),
            label: 'Home',
          ),
          ZeroNavigationBarItem(
            icon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notification),
            ),
            activeIcon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notificationFilled),
            ),
            label: 'Notif',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.message),
            activeIcon: Icon(ZeroIcons.messageFilled),
            label: 'Message',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.fire),
            activeIcon: Icon(ZeroIcons.fireFilled),
            label: 'More',
          ),
        ],
        type: ZeroNavigationBarType.iconLabel,
        style: ZeroNavigationBarStyle(),
      ),
    );
  }
}

class _DynamicLabel extends StatelessWidget {
  const _DynamicLabel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Label Appear on Active'),
      ),
      backgroundColor: Colors.green.shade100,
      bottomNavigationBar: const _ZeroNavigationBarBuilder(
        items: [
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.home),
            activeIcon: Icon(ZeroIcons.homeFilled),
            label: 'Home',
          ),
          ZeroNavigationBarItem(
            icon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notification),
            ),
            activeIcon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notificationFilled),
            ),
            label: 'Notif',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.message),
            activeIcon: Icon(ZeroIcons.messageFilled),
            label: 'Message',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.fire),
            activeIcon: Icon(ZeroIcons.fireFilled),
            label: 'More',
          ),
        ],
        type: ZeroNavigationBarType.iconLabelOnActive,
        style: ZeroNavigationBarStyle(),
      ),
    );
  }
}

class _CustomStyle extends StatelessWidget {
  const _CustomStyle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Style'),
      ),
      backgroundColor: Colors.green.shade100,
      bottomNavigationBar: _ZeroNavigationBarBuilder(
        items: const [
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.home),
            activeIcon: Icon(ZeroIcons.homeFilled),
            label: 'Home',
          ),
          ZeroNavigationBarItem(
            icon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notification),
            ),
            activeIcon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notificationFilled),
            ),
            label: 'Notif',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.message),
            activeIcon: Icon(ZeroIcons.messageFilled),
            label: 'Message',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.fire),
            activeIcon: Icon(ZeroIcons.fireFilled),
            label: 'More',
          ),
        ],
        style: ZeroNavigationBarStyle(
          indicatorColor: Colors.pink.withOpacity(0.3),
          selectedColor: Colors.pink,
          unselectedColor: Colors.yellow,
          backgroundColor: Colors.green.shade300,
        ),
      ),
    );
  }
}

class _ZeroNavigationBarBuilder extends StatefulWidget {
  const _ZeroNavigationBarBuilder({
    required this.items,
    this.type = ZeroNavigationBarType.iconLabel,
    this.style,
  });

  final List<ZeroNavigationBarItem> items;
  final ZeroNavigationBarStyle? style;
  final ZeroNavigationBarType type;

  @override
  State<_ZeroNavigationBarBuilder> createState() =>
      _ZeroNavigationBarBuilderState();
}

class _ZeroNavigationBarBuilderState extends State<_ZeroNavigationBarBuilder> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZeroNavigationBar(
      items: widget.items,
      activeIndex: activeIndex,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      style: widget.style,
      type: widget.type,
    );
  }
}
