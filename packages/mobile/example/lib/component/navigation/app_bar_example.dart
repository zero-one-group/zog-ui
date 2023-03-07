import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAppBarExample extends StatelessWidget {
  const ZeroAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero App Bar Example'),
      ),
      body: ListView(
        children: [
          ZeroListTile(
            title: 'Leading + Title',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar1()));
            },
          ),
          ZeroListTile(
            title: 'Leading + Title + Actions',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar2()));
            },
          ),
          ZeroListTile(
            title: 'Leading Drawer + Title + Actions',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar3()));
            },
          ),
          ZeroListTile(
            title: 'Medium Size',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar4()));
            },
          ),
          ZeroListTile(
            title: 'Large Size',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar5()));
            },
          ),
          ZeroListTile(
            title: 'Custom Style',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const _AppBar6()));
            },
          ),
        ],
      ),
    );
  }
}

class _AppBar1 extends StatelessWidget {
  const _AppBar1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Example 1'),
      ),
    );
  }
}

class _AppBar2 extends StatelessWidget {
  const _AppBar2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(ZeroIcons.coffee),
        ),
        title: const Text('Example 2'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.euro),
          )
        ],
      ),
    );
  }
}

class _AppBar3 extends StatelessWidget {
  const _AppBar3();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ZeroNavigationDrawer(),
      appBar: ZeroAppBar(
        title: const Text('Example 3'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.euro),
          )
        ],
      ),
    );
  }
}

class _AppBar4 extends StatelessWidget {
  const _AppBar4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        size: ZeroAppBarSize.medium,
        title: const Text('Example 4'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.euro),
          )
        ],
      ),
    );
  }
}

class _AppBar5 extends StatelessWidget {
  const _AppBar5();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        size: ZeroAppBarSize.large,
        title: const Text('Example 5'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.euro),
          )
        ],
      ),
    );
  }
}

class _AppBar6 extends StatelessWidget {
  const _AppBar6();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Example 6'),
        style: const ZeroAppBarStyle(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
          statusBarBrightness: Brightness.dark,
          shadows: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 20,
              spreadRadius: 4,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.appSync),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(ZeroIcons.euro),
          )
        ],
      ),
    );
  }
}
