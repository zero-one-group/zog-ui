import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroButtonExample extends StatelessWidget {
  const ZeroButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZeroAppBar(
        title: const Text('Zero Button Example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                /// basic button
                ZeroButton.primary(
                  text: 'Button Primary',
                  onPressed: () {},
                ),
                ZeroButton.secondary(
                  text: 'Button Secondary',
                  onPressed: () {},
                ),
                ZeroButton.disabled(
                  text: 'Button Disabled',
                ),
                ZeroButton.primary(
                  text: 'Button Disabled by isDisabled Property',
                  onPressed: () {},
                  isDisabled: true,
                ),
                ZeroButton.text(
                  text: 'Button Text',
                  onPressed: () {},
                ),

                /// left icon button
                ZeroButtonLIcon.primary(
                  icon: const Icon(Icons.search),
                  text: 'Button Left Icon Primary',
                  onPressed: () {},
                ),
                ZeroButtonLIcon.secondary(
                  icon: const Icon(Icons.search),
                  text: 'Button Left Icon Secondary',
                  onPressed: () {},
                ),
                ZeroButtonLIcon.disabled(
                  icon: const Icon(Icons.search),
                  text: 'Button Left Icon Disabled',
                ),
                ZeroButtonLIcon.text(
                  icon: const Icon(Icons.search),
                  text: 'Button Left Icon Text',
                  onPressed: () {},
                ),

                /// right icon button
                ZeroButtonRIcon.primary(
                  icon: const Icon(Icons.search),
                  text: 'Button Right Icon Primary',
                  onPressed: () {},
                ),
                ZeroButtonRIcon.secondary(
                  icon: const Icon(Icons.search),
                  text: 'Button Right Icon Secondary',
                  onPressed: () {},
                ),
                ZeroButtonRIcon.disabled(
                  icon: const Icon(Icons.search),
                  text: 'Button Right Icon Disabled',
                ),
                ZeroButtonRIcon.text(
                  icon: const Icon(Icons.search),
                  text: 'Button Right Icon Text',
                  onPressed: () {},
                ),

                /// right and left icon button
                ZeroButtonRLIcon.primary(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.search),
                  text: 'Button Right and Left Icon Primary',
                  onPressed: () {},
                ),
                ZeroButtonRLIcon.secondary(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.search),
                  text: 'Button Right and Left Icon Secondary',
                  onPressed: () {},
                ),
                ZeroButtonRLIcon.disabled(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.search),
                  text: 'Button Right and Left Icon Disabled',
                ),
                ZeroButtonRLIcon.text(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.search),
                  text: 'Button Right and Left Icon Text',
                  onPressed: () {},
                ),

                const SizedBox(height: 16),

                /// button with icon only
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.primary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                      borderRadiusType: ZeroButtonRadiusType.curved,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.small,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.medium,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                    const SizedBox(width: 16),
                    ZeroButtonIcon.secondary(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                      size: ZeroButtonSize.large,
                      borderRadiusType: ZeroButtonRadiusType.rounded,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ZeroButtonIcon.disabled(
                      icon: Icon(Icons.search),
                      size: ZeroButtonSize.small,
                    ),
                    SizedBox(width: 16),
                    ZeroButtonIcon.disabled(
                      icon: Icon(Icons.search),
                      size: ZeroButtonSize.medium,
                    ),
                    SizedBox(width: 16),
                    ZeroButtonIcon.disabled(
                      icon: Icon(Icons.search),
                      size: ZeroButtonSize.large,
                    ),
                  ],
                ),

                /// button size type
                ZeroButton.primary(
                  text: 'Button Small',
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.small,
                ),
                ZeroButton.primary(
                  text: 'Button Medium',
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.medium,
                ),
                ZeroButton.primary(
                  text: 'Button Small',
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.large,
                ),

                /// button radius type
                ZeroButton.primary(
                  text: 'Button Rectangle',
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.rectangle,
                ),
                ZeroButton.primary(
                  text: 'Button Curved',
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.curved,
                ),
                ZeroButton.primary(
                  text: 'Button Rounded',
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.rounded,
                ),

                /// button custom color
                ZeroButton.primary(
                  text: 'Button Color Red',
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.red),
                ),
                ZeroButton.primary(
                  text: 'Button Color Green',
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.green),
                ),
                ZeroButton.primary(
                  text: 'Button Color Orange',
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.orange),
                ),

                /// custom style
                ZeroButton.primary(
                  text: 'Button Custom Style',
                  onPressed: () {},
                  style: const ZeroButtonStyle(
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
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
