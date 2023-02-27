import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ListTileExamplePage extends StatefulWidget {
  const ListTileExamplePage({super.key});

  @override
  State<ListTileExamplePage> createState() => _ListTileExamplePageState();
}

class _ListTileExamplePageState extends State<ListTileExamplePage> {
  bool _isLoading = true;

  final random = Random();

  final List<String> _names = [
    'Muhammad R Kahfi',
    'Wisnu G Saputra',
    'Zulhijaya Zulhijaya',
    'Muhammad R Kahfi',
    'Wisnu G Saputra',
    'Zulhijaya Zulhijaya',
    'Muhammad R Kahfi',
    'Wisnu G Saputra',
    'Zulhijaya Zulhijaya'
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        _isLoading = !_isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tiles'),
      ),
      body: ZeroSkeleton(
        isLoading: _isLoading,
        skeleton: _skeletonView(),
        duration: const Duration(seconds: 5),
        child: _contentView(),
      ),
    );
  }

  SkeletonItem _skeletonView() => ZeroSkeletonListView(
        item: ZeroSkeletonListTile(
          padding: const EdgeInsets.all(16),
          verticalSpacing: 16,
          leadingStyle: const SkeletonAvatarStyle(
              width: 64, height: 64, shape: BoxShape.circle),
          titleStyle: SkeletonLineStyle(
              height: 16,
              minLength: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          subtitleStyle: SkeletonLineStyle(
              height: 12,
              maxLength: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          trailing: ZeroSkeletonAvatar(
              style: const SkeletonAvatarStyle(shape: BoxShape.rectangle)),
          hasSubtitle: true,
        ),
      );

  Widget _contentView() => ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      physics: const ScrollPhysics(),
      itemCount: _names.length,
      itemBuilder: (context, index) => ZeroListTile(
            title: 'This is title ${index + 1}',
            subtitle: 'This is sub title ${_names[index]}',
            leftIcon: ZeroAvatar.initial(_names[index]),
            rightIcon: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: ZeroColors.primary, shape: BoxShape.rectangle)),
          ));
}
//  ListView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) => Container(),
//       )
