import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ItemsExamplePage extends StatelessWidget {
  const ItemsExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0E0E0E),
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          _linesView(),
          const SizedBox(
            height: 16,
          ),
          _avatarsView(),
          const SizedBox(
            height: 16,
          ),
          _listTilesView(),
          const SizedBox(
            height: 16,
          ),
          _paragraphsView(),
        ],
      ),
    );
  }

  Widget _linesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'SkeletonLine',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Divider(),
        ZeroSkeletonLine(),
        ZeroSkeletonLine(
          style: SkeletonLineStyle(
            padding: const EdgeInsets.all(16.0),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        ZeroSkeletonLine(
          style: const SkeletonLineStyle(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            height: 11,
          ),
        ),
        ZeroSkeletonLine(
          style: SkeletonLineStyle(
              padding: const EdgeInsets.all(16.0),
              borderRadius: BorderRadius.circular(8),
              height: 28,
              randomLength: true),
        ),
      ],
    );
  }

  Widget _avatarsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'SkeletonAvatar',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalDivider(),
            ZeroSkeletonAvatar(),
            const VerticalDivider(),
            ZeroSkeletonAvatar(
              style: SkeletonAvatarStyle(
                  borderRadius: BorderRadius.circular(8),
                  height: 62,
                  width: 62),
            ),
            const VerticalDivider(),
            ZeroSkeletonAvatar(
              style: const SkeletonAvatarStyle(
                  shape: BoxShape.circle, height: 72, width: 72),
            ),
            const VerticalDivider(),
            ZeroSkeletonAvatar(
              style: const SkeletonAvatarStyle(height: 96, width: 72),
            ),
          ],
        ),
      ],
    );
  }

  Widget _listTilesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'SkeletonListTile',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Divider(),
        ZeroSkeletonListTile(
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        ZeroSkeletonListTile(
          hasSubtitle: true,
          padding: const EdgeInsets.all(16),
        ),
        ZeroSkeletonListTile(
          hasSubtitle: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          leadingStyle: const SkeletonAvatarStyle(
              shape: BoxShape.circle, width: 64, height: 64),
          titleStyle:
              SkeletonLineStyle(borderRadius: BorderRadius.circular(16)),
          subtitleStyle: SkeletonLineStyle(
              borderRadius: BorderRadius.circular(16),
              randomLength: true,
              maxLength: 128),
          verticalSpacing: 16,
        ),
        ZeroSkeletonListTile(
          hasSubtitle: true,
          padding: const EdgeInsets.all(16),
          leadingStyle: const SkeletonAvatarStyle(
              shape: BoxShape.circle, width: 72, height: 72),
          titleStyle: const SkeletonLineStyle(height: 18),
          subtitleStyle: const SkeletonLineStyle(
            height: 12,
            maxLength: 172,
            minLength: 128,
          ),
          verticalSpacing: 16,
          contentSpacing: 6,
          trailing: ZeroSkeletonAvatar(
            style: SkeletonAvatarStyle(
                height: 32,
                width: 50,
                borderRadius: BorderRadius.circular(4),
                padding: const EdgeInsetsDirectional.only(start: 16)),
          ),
        ),
      ],
    );
  }

  Widget _paragraphsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'SkeletonParagraph',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Divider(),
        ZeroSkeletonParagraph(),
        const Divider(),
        ZeroSkeletonParagraph(
          style: SkeletonParagraphStyle(
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                  height: 16,
                  randomLength: true,
                  borderRadius: BorderRadius.circular(16))),
        ),
        const Divider(),
        ZeroSkeletonParagraph(
          style: const SkeletonParagraphStyle(
              lines: 8,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                height: 12,
                randomLength: true,
              )),
        ),
        const Divider(),
        ZeroSkeletonParagraph(
          style: const SkeletonParagraphStyle(
              lines: 5,
              spacing: 8,
              lineStyle: SkeletonLineStyle(
                alignment: Alignment.center,
                height: 12,
                randomLength: true,
              )),
        ),
        const Divider(),
      ],
    );
  }
}
