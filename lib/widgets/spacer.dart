part of flutter_cupertino_settings;

class CSSpacer extends StatelessWidget {
  final BorderSide bottomBorder;

  /// Default: CupertinoColors.systemGroupedBackground
  final Color backgroundColor;

  const CSSpacer({
    Key key,
    this.bottomBorder,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: backgroundColor ??
            CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: Border(
          bottom: bottomBorder ?? kCupertinoBorderSide(context),
        ),
      ),
    );
  }
}
