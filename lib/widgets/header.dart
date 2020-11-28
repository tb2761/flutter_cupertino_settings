part of flutter_cupertino_settings;

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class CSHeader extends StatelessWidget {
  final String title;
  final BorderSide? bottomBorder;
  final TextStyle? style;

  const CSHeader(
    this.title, {
    this.bottomBorder,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    var effectiveTextStyle = basicTextStyle(context).copyWith(
      color: CupertinoColors.secondaryLabel.resolveFrom(context),
      fontSize: kCSHeaderFontsize,
    );

    if (style != null) {
      effectiveTextStyle = effectiveTextStyle.merge(style!);
    }

    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: Border(
          bottom: bottomBorder ?? kCupertinoBorderSide(context),
        ),
      ),
      child: Text(
        title.toUpperCase(),
        style: effectiveTextStyle,
      ),
    );
  }
}
