import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationRailExample extends StatefulWidget {
  const ZeroNavigationRailExample({super.key});

  @override
  State<ZeroNavigationRailExample> createState() =>
      _ZeroNavigationRailExampleState();
}

class _ZeroNavigationRailExampleState extends State<ZeroNavigationRailExample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Navigation Rail Example'),
      ),
      body: Row(
        children: [
          ZeroNavigationRail(
            items: List<ZeroNavigationRailItem>.generate(
                15,
                (index) => const ZeroNavigationRailItem(
                      icon: Icon(ZeroIcons.home),
                      activeIcon: Icon(
                        ZeroIcons.homeFilled,
                        color: Colors.white,
                      ),
                      label: Text('Home'),
                    )),
            type: ZeroNavigationRailType.iconLabelOnActive,
            activeIndex: selectedIndex,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(ZeroIcons.menu),
            ),
            action: ZeroButtonIcon.primary(
              icon: const Icon(ZeroIcons.search),
              onPressed: () {},
              borderRadiusType: ZeroButtonRadiusType.curved,
              size: ZeroButtonSize.large,
            ),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
