import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

List<Option<BoxShape>> _shapeOptions = [
  const Option(label: 'rectangle', value: BoxShape.rectangle),
  const Option(label: 'circle', value: BoxShape.circle)
];

WidgetbookComponent skeletonWidgetbookComponent = WidgetbookComponent(
  name: 'Skeleton',
  useCases: [
    WidgetbookUseCase(
      name: 'Items',
      builder: (context) => PreviewWidget(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZeroSkeletonAvatar(
                style: SkeletonAvatarStyle(
                    borderRadius: BorderRadius.all(Radius.circular(context.knobs
                        .number(label: 'SkeletonAvatar Radius', initialValue: 8)
                        .toDouble())),
                    shape: context.knobs.options(
                      label: 'Avatar Shape',
                      options: _shapeOptions,
                    ),
                    height: context.knobs
                        .number(
                            label: 'SkeletonLAvatar Height', initialValue: 30)
                        .toDouble(),
                    width: context.knobs
                        .number(label: 'SkeletonAvatar Width', initialValue: 30)
                        .toDouble()),
              ),
              const SizedBox(
                height: 10,
              ),
              const ZeroDivider(),
              const SizedBox(
                height: 10,
              ),
              ZeroSkeletonLine(
                style: SkeletonLineStyle(
                    alignment: Alignment.bottomCenter,
                    borderRadius: BorderRadius.all(Radius.circular(context.knobs
                        .number(label: 'SkeletonLine Radius', initialValue: 8)
                        .toDouble())),
                    randomLength: context.knobs
                        .boolean(label: 'Random length', initialValue: false),
                    height: context.knobs
                        .number(label: 'SkeletonLine Height', initialValue: 8)
                        .toDouble(),
                    width: context.knobs
                        .number(label: 'SkeletonLine Width', initialValue: 50)
                        .toDouble()),
              ),
              const SizedBox(
                height: 10,
              ),
              const ZeroDivider(),
              const SizedBox(
                height: 10,
              ),
              ZeroSkeletonListTile(
                hasLeading: context.knobs.boolean(
                    label: 'SkeletonListTile has heading', initialValue: true),
                hasSubtitle: context.knobs.boolean(
                    label: 'SkeletonListTile has subtitle', initialValue: true),
                contentSpacing: context.knobs
                    .number(
                        label: 'SkeletonListTile Content Spacing',
                        initialValue: 8)
                    .toDouble(),
              ),
              const SizedBox(
                height: 10,
              ),
              const ZeroDivider(),
              const SizedBox(
                height: 10,
              ),
              ZeroSkeletonParagraph(
                style: SkeletonParagraphStyle(
                    lines: context.knobs
                        .number(
                            label: 'SkeletonParagraph lines', initialValue: 4)
                        .toInt(),
                    spacing: context.knobs
                        .number(
                            label: 'SkeletonParagraph spacing', initialValue: 8)
                        .toDouble()),
              )
            ],
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
        name: 'List Tile',
        builder: (context) => PreviewWidget(
              child: ZeroSkeletonListTile(
                padding: const EdgeInsets.all(16),
                verticalSpacing: 16,
                leadingStyle: SkeletonAvatarStyle(
                    width: 64,
                    height: 64,
                    shape: context.knobs.options(
                        label: 'Leading Shape',
                        options: _shapeOptions.reversed.toList())),
                titleStyle: SkeletonLineStyle(
                    height: 16,
                    minLength: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    randomLength: context.knobs.boolean(
                        label: 'Title length is random', initialValue: true),
                    borderRadius: BorderRadius.circular(context.knobs
                        .number(label: 'Title border radius', initialValue: 12)
                        .toDouble())),
                subtitleStyle: SkeletonLineStyle(
                    height: 12,
                    maxLength: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    randomLength: context.knobs.boolean(
                        label: 'Subtitle length is random', initialValue: true),
                    borderRadius: BorderRadius.circular(context.knobs
                        .number(
                            label: 'Subtitle border radius', initialValue: 12)
                        .toDouble())),
                trailing: ZeroSkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        width: 60,
                        height: 50,
                        shape: context.knobs.options(
                            label: 'Trailing Shape', options: _shapeOptions))),
                hasSubtitle: context.knobs
                    .boolean(label: 'Has Subtitle', initialValue: true),
              ),
            )),
    WidgetbookUseCase(
      name: 'Card',
      builder: (context) => PreviewWidget(
        child: ZeroCard(
          style: const ZeroCardElevatedStyle(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SkeletonItem(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (context.knobs
                        .boolean(label: 'Has Avatar', initialValue: true)) ...[
                      ZeroSkeletonAvatar(
                        style: const SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                    Expanded(
                      child: ZeroSkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 2,
                            spacing: 6,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
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
                if (context.knobs
                    .boolean(label: 'Has Image', initialValue: true))
                  ZeroSkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      minHeight: MediaQuery.of(context).size.height / 8,
                      maxHeight: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                if (context.knobs.boolean(label: 'Has Description Paragraph'))
                  SizedBox(
                    width: 100,
                    child: ZeroSkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 2,
                          spacing: 6,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 10),
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 6,
                            maxLength: MediaQuery.of(context).size.width / 3,
                          )),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (context.knobs.boolean(label: 'Has action buttons'))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ZeroSkeletonLine(
                        style: SkeletonLineStyle(
                            height: 30,
                            width: 50,
                            borderRadius: BorderRadius.all(Radius.circular(
                                context.knobs
                                    .number(
                                        label: 'Card Button Radius',
                                        initialValue: 10)
                                    .toDouble()))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ZeroSkeletonLine(
                        style: SkeletonLineStyle(
                            height: 30,
                            width: 50,
                            borderRadius: BorderRadius.all(Radius.circular(
                                context.knobs
                                    .number(
                                        label: 'Card Button Radius',
                                        initialValue: 10)
                                    .toDouble()))),
                      )
                    ],
                  )
              ],
            )),
          ),
        ),
      ),
    ),
  ],
);
