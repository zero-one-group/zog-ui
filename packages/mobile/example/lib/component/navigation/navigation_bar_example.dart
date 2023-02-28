import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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
    return const _ZeroNavigationBarBuilder(
      title: 'Default',
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
    );
  }
}

class _AdaptiveIcon extends StatelessWidget {
  const _AdaptiveIcon();

  @override
  Widget build(BuildContext context) {
    return const _ZeroNavigationBarBuilder(
      title: 'Adaptive Icon',
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
    );
  }
}

class _DynamicLabel extends StatelessWidget {
  const _DynamicLabel();

  @override
  Widget build(BuildContext context) {
    return const _ZeroNavigationBarBuilder(
      title: 'Label Appear on Active',
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
    );
  }
}

class _CustomStyle extends StatelessWidget {
  const _CustomStyle();

  @override
  Widget build(BuildContext context) {
    return _ZeroNavigationBarBuilder(
      title: 'Custom Style',
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
    );
  }
}

class _ZeroNavigationBarBuilder extends StatefulWidget {
  const _ZeroNavigationBarBuilder({
    required this.items,
    this.type = ZeroNavigationBarType.iconLabel,
    this.style,
    required this.title,
  });

  final List<ZeroNavigationBarItem> items;
  final ZeroNavigationBarStyle? style;
  final ZeroNavigationBarType type;
  final String title;

  @override
  State<_ZeroNavigationBarBuilder> createState() =>
      _ZeroNavigationBarBuilderState();
}

class _ZeroNavigationBarBuilderState extends State<_ZeroNavigationBarBuilder> {
  int activeIndex = 0;
  ZeroNavigationBarIndicatorType? indicatorType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ZeroText.body2('Oval'),
            const SizedBox(width: 8),
            Switch(
              onChanged: (value) {
                setState(() {
                  indicatorType = value == true
                      ? ZeroNavigationBarIndicatorType.circle
                      : ZeroNavigationBarIndicatorType.oval;
                });
              },
              value: indicatorType == ZeroNavigationBarIndicatorType.circle,
            ),
            const SizedBox(width: 8),
            const ZeroText.body2('Circle'),
          ],
        ),
      ),
      bottomNavigationBar: ZeroNavigationBar(
        items: widget.items,
        activeIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        style: widget.style?.copyWith(indicatorType: indicatorType),
        type: widget.type,
      ),
    );
  }
}
