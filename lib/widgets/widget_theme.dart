part of flutter_cupertino_settings;

class DefaultCSWidgetTheme extends InheritedTheme {
  final CSWidgetStyle style;
  final double height;

  const DefaultCSWidgetTheme({
    super.key,
    this.height = kCSItemHeight,
    required this.style,
    required super.child,
  });

  /// A const-constructible default text style that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [DefaultCSWidgetTheme] that lacks a [child],
  /// which means the constructed value cannot be incorporated into the tree.
  DefaultCSWidgetTheme.fallback({super.key, required BuildContext context})
      : height = kCSItemHeight,
        style = CSWidgetStyle.fallback(context),
        super(
          child: const SizedBox(),
        );

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
  // ignore: prefer_constructors_over_static_methods
  static DefaultCSWidgetTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DefaultCSWidgetTheme>() ??
        DefaultCSWidgetTheme.fallback(
          context: context,
        );
  }

  static Widget merge({
    Key? key,
    required CSWidgetStyle style,
    required Widget child,
  }) {
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
