part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  /// The widget displayed at the left side of the widget.
  final Widget nameWidget;

  /// The widget displayed at the right side of the widget.
  final Widget contentWidget;

  /// The fontsize applied to the children.
  final double fontSize;

  CSControl({
    this.nameWidget,
    this.contentWidget,
    CSWidgetStyle style,
    this.fontSize,
  }) : super(
          _ControlWidget(
            fontSize: fontSize ?? kCSTitleFontsize,
            contentWidget: contentWidget,
            nameWidget: nameWidget,
          ),
          style: style,
        );
}

class _ControlWidget extends StatelessWidget {
  final Widget nameWidget;
  final Widget contentWidget;
  final double fontSize;

  const _ControlWidget({
    Key key,
    this.fontSize,
    this.contentWidget,
    this.nameWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: basicTextStyle(context).copyWith(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: fontSize,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (nameWidget != null) nameWidget,
          if (contentWidget != null) contentWidget,
        ],
      ),
    );
  }
}
