import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class CardsExamplePage extends StatefulWidget {
  const CardsExamplePage({super.key});

  @override
  State<CardsExamplePage> createState() => _CardsExamplePageState();
}

class _CardsExamplePageState extends State<CardsExamplePage> {
  bool _isLoading = true;

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
        title: const Text('Card'),
      ),
      backgroundColor: Colors.grey[300],
      body: SizedBox(
        width: double.infinity,
        child: _isLoading ? _skeletonView() : _contentView(),
      ),
    );
  }

  Widget _skeletonView() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SkeletonItem(
                child: Column(
              children: [
                Row(
                  children: [
                    ZeroSkeletonAvatar(
                      style: const SkeletonAvatarStyle(
                        shape: BoxShape.circle,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: ZeroSkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 2,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
                            )),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ZeroSkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    width: double.infinity,
                    minHeight: MediaQuery.of(context).size.height / 8,
                    maxHeight: MediaQuery.of(context).size.height / 3,
                  ),
                ),
              ],
            )),
          ),
        ),
      );

  Widget _contentView() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ZeroCard(
                style: const ZeroCardElevatedStyle(
                  elevation: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ZeroAvatar.initial(
                            'Elevated Card',
                            size: AvatarSize.m,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Elevated Card',
                                  style: context.theme.typography.body1
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Text('ZeroCardElevatedStyle',
                                  style: context.theme.typography.caption),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: SizedBox(
                          child: Image.network(
                            'https://picsum.photos/205',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ZeroCard(
                style: const ZeroCardOutlinedStyle(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ZeroAvatar.initial(
                            'Outline Card',
                            size: AvatarSize.m,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Elevated Card',
                                  style: context.theme.typography.body1
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Text('ZeroCardElevatedStyle',
                                  style: context.theme.typography.caption),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: SizedBox(
                          child: Image.network(
                            'https://picsum.photos/205',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ZeroCard(
                style: ZeroCardFilledStyle(
                  backgroundColor: context.theme.colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ZeroAvatar.initial(
                            'Outline Card',
                            size: AvatarSize.m,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Elevated Card',
                                  style: context.theme.typography.body1
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              Text('ZeroCardElevatedStyle',
                                  style: context.theme.typography.caption),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Flexible(
                        child: SizedBox(
                          child: Image.network(
                            'https://picsum.photos/205',
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
