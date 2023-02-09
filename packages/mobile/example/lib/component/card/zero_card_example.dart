import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroCardExample extends StatefulWidget {
  const ZeroCardExample({super.key});

  @override
  State<ZeroCardExample> createState() => _ZeroCardExampleState();
}

class _ZeroCardExampleState extends State<ZeroCardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Card Example'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZeroCard(
                title: 'Title',
                subtitle: 'Subtitle',
                header: 'Header',
                subheader: 'Subheader',
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                // avatar: ZeroAvatar.url(
                //   'https://picsum.photos/200',
                //   size: AvatarSize.m,
                // ),
                // image: Image.network(
                //   'https://picsum.photos/300',
                //   fit: BoxFit.cover,
                // ),
                // cardPadding: 16,
                // actions: [
                //   ZeroButton.secondary(
                //     text: 'Cancel',
                //     onPressed: () {},
                //     height: 35,
                //     buttonSizeType: ZeroSizeType.small,
                //     buttonRadiusType: ZeroButtonRadiusType.rounded,
                //     style: const ZeroButtonStyle(
                //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                //     ),
                //   ),
                //   ZeroButton.primary(
                //     text: 'OK',
                //     onPressed: () {},
                //     height: 35,
                //     buttonSizeType: ZeroSizeType.small,
                //     buttonRadiusType: ZeroButtonRadiusType.rounded,
                //     style: const ZeroButtonStyle(
                //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                //     ),
                //   ),
                // ],
              ),
              const SizedBox(height: 16),
              ZeroCardVertical(
                header: 'Header',
                subheader: 'Subheader',
                avatar: ZeroAvatar.initial('John Smith'),
                image: Image.network(
                  'https://picsum.photos/300',
                  fit: BoxFit.cover,
                ),
                filledColor: ZeroColors.neutral[5],
                variant: ZeroCardVariant.filled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
