part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSSecret extends StatefulWidget {
  final String text;
  final String secret;
  final double fontSize;
  final CSWidgetStyle style;

  const CSSecret(
    this.text,
    this.secret, {
    this.style,
    this.fontSize,
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
          fontSize: widget.fontSize ?? kCSTitleFontsize,
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
                  onPressed: () => setState(() => _show = !_show),
                  child: const Icon(
                    CupertinoIcons.eye_solid,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      style: const CSWidgetStyle(
        addPaddingToBorder: true,
      ).merge(
        widget.style,
      ),
    );
  }
}
