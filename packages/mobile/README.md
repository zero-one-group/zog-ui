<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This is a collection of component widgets developed by Zero One Group.

## Features
This package consists of components and a theme extension.

### Components

#### Forms

- ZeroTextfield
- ZeroDropdown
- ZeroRadioGroup
- ZeroDropdownButton
- ZeroDropdownMenu
- ZeroCheckbox
- ZeroSwitch
- ZeroSlider

#### Buttons

- ZeroButton
- ZeroButtonGroup

#### Navigations

- ZeroNavigationBar
- ZeroNavigationDrawer
- ZeroAppBar
- ZeroNavigationRail
- ZeroTabBar


### Theme

- ZeroTheme
- ZeroThemeData

### Foundation
- Colors
- Typography

#### Forms

- ZeroTextfield
- ZeroButton
- ZeroButtonGroup
- ZeroDropdown

For more information about the available components, please refer: [https://zero-ui-mobile.web.app/#/](https://zero-ui-mobile.web.app/#/)

## Usage

### Add dependency 
Please check the latest version before installation. If there is any problem with the new version, please use the previous version

```dart
    dependencies:
    flutter:
        sdk: flutter
    zog_ui: ^{latest version}
```

### Import the package
Add the following imports to your Dart code. The first file  that need this to be imported in is the file contains `MaterialApp`
import 'package:zog_ui/zog_ui.dart';

### Use ZeroApp
Replace your `MaterialApp` with `ZeroApp`. Otherwise it will not work. All the build-in Flutter widgets are fully supported here as well.

## Additional information
If you want to browse all the available widget, on you VS Code editor, just type "Zero" and then hold cmd+space. It will show the suggestion of what are available.

For more informationa and previews of the available components, please refer: [https://zero-ui-mobile.web.app/#/](https://zero-ui-mobile.web.app/#/)