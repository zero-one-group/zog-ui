import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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
                  child: const Text('Button Primary'),
                  onPressed: () {},
                ),
                ZeroButton.primary(
                  child: const Text('Button Primary disabled'),
                  onPressed: () {},
                  isDisabled: true,
                ),
                ZeroButton.secondary(
                  child: const Text('Button Secondary'),
                  onPressed: () {},
                ),
                ZeroButton.secondary(
                  child: const Text('Button Secondary disabled'),
                  onPressed: () {},
                  isDisabled: true,
                ),
                ZeroButton.secondary(
                  child: const Text('Button Disabled by isDisabled Property'),
                  onPressed: () {},
                  isDisabled: true,
                  style: const ZeroButtonStyle(),
                  buttonRadiusType: ZeroButtonRadiusType.rounded,
                ),
                ZeroButton.text(
                  child: const Text('Button Text'),
                  onPressed: () {},
                ),
                ZeroButton.text(
                  child: const Text('Button Text disabled'),
                  onPressed: () {},
                  isDisabled: true,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ZeroDivider(),
                ),

                /// left icon button
                ZeroButton.primary(
                  child: _leftIcon('Button Left Icon Primary'),
                  onPressed: () {},
                ),
                ZeroButton.primary(
                  child: _leftIcon('Button Left Icon Primar Disabled'),
                  isDisabled: true,
                  onPressed: () {},
                ),
                ZeroButton.secondary(
                  child: _leftIcon('Button Left Icon Secondary'),
                  onPressed: () {},
                ),
                ZeroButton.disabled(
                  child: _leftIcon('Button Left Icon Disabled'),
                ),
                ZeroButton.text(
                  child: _leftIcon('Button Left Icon Text'),
                  onPressed: () {},
                ),
                ZeroButton.text(
                  child: _leftIcon('Button Left Icon Text disabled'),
                  onPressed: () {},
                  isDisabled: true,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ZeroDivider(),
                ),

                /// right icon button
                ZeroButton.primary(
                  child: _rightIcon('Button Right Icon Primary'),
                  onPressed: () {},
                ),
                ZeroButton.secondary(
                  child: _rightIcon('Button Right Icon Secondary'),
                  onPressed: () {},
                ),
                ZeroButton.disabled(
                  child: _rightIcon('Button Right Icon Disabled'),
                ),
                ZeroButton.text(
                  child: _rightIcon('Button Right Icon Text'),
                  onPressed: () {},
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ZeroDivider(),
                ),

                /// right and left icon button
                ZeroButton.primary(
                  child: _leftRightIcon('Button Right and Left Icon Primary'),
                  onPressed: () {},
                ),
                ZeroButton.secondary(
                  child: _leftRightIcon('Button Right and Left Icon Secondary'),
                  onPressed: () {},
                ),
                ZeroButton.disabled(
                  child: _leftRightIcon('Button Right and Left Icon Disabled'),
                ),
                ZeroButton.text(
                  child: _leftRightIcon('Button Right and Left Icon Text'),
                  onPressed: () {},
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ZeroDivider(),
                ),

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

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ZeroDivider(),
                ),

                /// button size type
                ZeroButton.primary(
                  child: const Text('Button Small'),
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.small,
                ),
                ZeroButton.primary(
                  child: const Text('Button Medium'),
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.medium,
                ),
                ZeroButton.primary(
                  child: const Text('Button Small'),
                  onPressed: () {},
                  buttonSizeType: ZeroSizeType.large,
                ),

                /// button radius type
                ZeroButton.primary(
                  child: const Text('Button Rectangle'),
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.rectangle,
                ),
                ZeroButton.primary(
                  child: const Text('Button Curved'),
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.curved,
                ),
                ZeroButton.primary(
                  child: const Text('Button Rounded'),
                  onPressed: () {},
                  buttonRadiusType: ZeroButtonRadiusType.rounded,
                ),

                /// button custom color
                ZeroButton.primary(
                  child: const Text('Button Color Red'),
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.red),
                ),
                ZeroButton.primary(
                  child: const Text('Button Color Green'),
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.green),
                ),
                ZeroButton.primary(
                  child: const Text('Button Color Orange'),
                  onPressed: () {},
                  style: const ZeroButtonStyle(backgroundColor: Colors.orange),
                ),

                /// custom style
                ZeroButton.primary(
                  child: const Text('Button Custom Style'),
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

  Widget _leftIcon(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(ZeroIcons.search),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }

  Widget _rightIcon(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text),
        const SizedBox(width: 10),
        const Icon(ZeroIcons.search),
      ],
    );
  }

  Widget _leftRightIcon(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(ZeroIcons.search),
        const SizedBox(width: 10),
        Text(text),
        const SizedBox(width: 10),
        const Icon(ZeroIcons.search),
      ],
    );
  }
}
