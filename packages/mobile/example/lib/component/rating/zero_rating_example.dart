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
                initialValue: 1,
                allowHalfRating: true,
                sizeType: ZeroSizeType.small,
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 5,
                initialValue: 2,
                allowHalfRating: true,
                sizeType: ZeroSizeType.medium,
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 5,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 5,
                minValue: 1,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                onRatingUpdate: (val) {},
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 5,
                minValue: 1,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                isDisabled: false,
                onRatingUpdate: (val) {},
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.star),
                  half: const Icon(Icons.star_half),
                  empty: const Icon(Icons.star_border),
                ),
              ),
              const SizedBox(height: 20),
              ZeroRating(
                itemCount: 10,
                minValue: 3,
                initialValue: 3,
                allowHalfRating: true,
                sizeType: ZeroSizeType.large,
                isDisabled: false,
                style: const ZeroRatingStyle(
                  activeColor: Colors.pink,
                  inactiveColor: Colors.green,
                  spacing: 6,
                ),
                onRatingUpdate: (val) {},
                ratingWidget: RatingWidget(
                  full: const Icon(Icons.volume_up),
                  half: const Icon(Icons.volume_mute),
                  empty: const Icon(Icons.volume_mute),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
