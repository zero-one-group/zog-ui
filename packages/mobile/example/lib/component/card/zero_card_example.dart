import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                ZeroCard(
                  style: const ZeroCardElevatedStyle(
                    elevation: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                Text('ZeroCardElevatedStyle',
                                    style: context.theme.typography.caption),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          child: Image.network(
                            'https://picsum.photos/205',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ZeroCard(
                  style: const ZeroCardOutlinedStyle(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ZeroAvatar.initial(
                              'Outlined Card',
                              size: AvatarSize.m,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Outlined Card',
                                    style: context.theme.typography.body1
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                Text('ZeroCardOutlinedStyle',
                                    style: context.theme.typography.caption),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          child: Image.network(
                            'https://picsum.photos/202',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ZeroCard(
                  style: ZeroCardFilledStyle(
                    backgroundColor: context.theme.colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ZeroAvatar.initial(
                              'Filled Card',
                              size: AvatarSize.m,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Filled Card',
                                    style: context.theme.typography.body1
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                Text('ZeroCardFilledStyle',
                                    style: context.theme.typography.caption),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Image.network(
                          'https://picsum.photos/200',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
