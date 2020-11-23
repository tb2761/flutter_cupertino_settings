part of flutter_cupertino_settings;

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class CSHeader extends StatelessWidget {
  final String title;
  final BorderSide bottomBorder;
  final double fontSize;

  const CSHeader(
    this.title, {
    this.bottomBorder,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
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
        style: basicTextStyle(context).copyWith(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: this.fontSize ?? CS_HEADER_FONT_SIZE,
        ),
      ),
    );
  }
}
