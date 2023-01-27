import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroRatingExample extends StatelessWidget {
  const ZeroRatingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Rating Example'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZeroRating(
                itemCount: 5,
                spacing: 5,
                minValue: 1,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.medium,
                isDisabled: false,
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 5,
                spacing: 5,
                minValue: 1,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                isDisabled: false,
                onRatingUpdate: (val) {},
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: ZeroColors.sunriseYellow6),
                  half: const Icon(Icons.star_half, color: ZeroColors.sunriseYellow6),
                  empty: const Icon(Icons.star_border, color: ZeroColors.neutral5),
                ),
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 10,
                spacing: 1,
                minValue: 3,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                isDisabled: false,
                onRatingUpdate: (val) {},
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.volume_up, color: ZeroColors.primary6, size: 30),
                  half: const Icon(Icons.volume_mute, color: ZeroColors.primary4, size: 30),
                  empty: const Icon(Icons.volume_mute, color: ZeroColors.neutral5, size: 30),
                ),
              ),
              // const SizedBox(height: 20),
              // ZeroRatingCustom(
              //   spacing: 4,
              //   initialValue: 1,
              //   isDisabled: false,
              //   activeColor: ZeroColors.sunriseYellow6,
              //   inactiveColor: ZeroColors.neutral5,
              //   sizeType: ZeroSizeType.small,
              //   onRatingUpdate: (val) {
              //     log(val.toString());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
