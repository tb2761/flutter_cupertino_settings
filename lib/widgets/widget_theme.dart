part of flutter_cupertino_settings;

class DefaultCSWidgetTheme extends InheritedTheme {
  final CSWidgetStyle style;
  final double height;

  const DefaultCSWidgetTheme({
    Key key,
    this.height,
    @required this.style,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  /// A const-constructible default text style that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [DefaultCSWidgetTheme] that lacks a [child], which
  /// means the constructed value cannot be incorporated into the tree.
  DefaultCSWidgetTheme.fallback({Key key, BuildContext context})
      : height = kCSItemHeight,
        style = CSWidgetStyle.fallback(context),
        super(key: key, child: null);

  /// The closest instance of this class that encloses the given context.
  ///
  /// If no such instance exists, returns an instance created by
  /// [DefaultCSWidgetTheme.fallback], which contains fallback values.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// DefaultCSWidgetTheme style = DefaultCSWidgetTheme.of(context);
  /// ```
  static DefaultCSWidgetTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultCSWidgetTheme>() ??
        DefaultCSWidgetTheme.fallback(
          context: context,
        );
  }

  static Widget merge({
    Key key,
    CSWidgetStyle style,
    @required Widget child,
  }) {
    assert(child != null);
    return Builder(
      builder: (context) {
        final parent = DefaultCSWidgetTheme.of(context);
        return DefaultCSWidgetTheme(
          key: key,
          style: parent.style.merge(style),
          child: child,
        );
      },
    );
  }

  @override
  bool updateShouldNotify(DefaultCSWidgetTheme oldWidget) {
    return style != oldWidget.style;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final defaultCSWidgetTheme =
        context.findAncestorWidgetOfExactType<DefaultCSWidgetTheme>();

    return identical(this, defaultCSWidgetTheme)
        ? child
        : DefaultCSWidgetTheme(
            style: style,
            child: child,
          );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty(
        'style',
        style,
        showName: true,
      ),
    );
  }
}
