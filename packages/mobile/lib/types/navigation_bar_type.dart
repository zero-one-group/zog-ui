/// List types of [ZeroNavigationBarType]
///
/// This type use for [ZeroNavigationBar] component
enum ZeroNavigationBarType {
  /// [ZeroNavigationBar] icon and label always appears when state is active or inactive
  iconLabel,

  /// [ZeroNavigationBar] label appear when state is active
  ///
  /// For icon, still always appear
  iconLabelOnActive,
}

/// List indicator type of style [ZeroNavigationBar]
enum ZeroNavigationBarIndicatorType {
  /// [ZeroNavigationBar] indicator while active is oval
  oval,

  /// [ZeroNavigationBar] indicator while active is circle
  circle;

  /// Getter check this [indicator] oval or not
  bool get isOval => this == oval;

  /// Getter check this [indicator] circle or not
  bool get isCircle => this == circle;
}
