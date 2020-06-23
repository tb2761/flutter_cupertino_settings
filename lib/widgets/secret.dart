part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSSecret extends StatefulWidget {
  final String text;
  final String secret;
  final double fontSize;
  final CSWidgetStyle style;
  final bool addPaddingToBorder;
  final Color backgroundColor;
  final BorderSide topBorder;
  final BorderSide bottomBorder;

  const CSSecret(
    this.text,
    this.secret, {
    this.style,
    this.fontSize,
    this.addPaddingToBorder,
    this.backgroundColor,
    this.topBorder,
    this.bottomBorder,
  });

  @override
  _CSSecretState createState() => _CSSecretState();
}

class _CSSecretState extends State<CSSecret> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return CSWidget(
      DefaultTextStyle(
        style: basicTextStyle(context).copyWith(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: widget.fontSize ?? CS_TITLE_FONT_SIZE,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.text),
            Row(
              children: <Widget>[
                Text(
                  _show ? widget.secret : '•' * widget.secret.length,
                ),
                CupertinoButton(
                  child: Icon(
                    CupertinoIcons.eye_solid,
                    size: CS_CHECK_SIZE,
                  ),
                  onPressed: () => setState(() => _show = !_show),
                ),
              ],
            ),
          ],
        ),
      ),
      style: widget.style,
      addPaddingToBorder: widget.addPaddingToBorder ?? true,
      backgroundColor: widget.backgroundColor,
      topBorder: widget.topBorder,
      bottomBorder: widget.bottomBorder
    );
  }
}
