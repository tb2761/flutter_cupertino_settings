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
    required this.nameWidget,
    required this.contentWidget,
    CSWidgetStyle? style,
    this.fontSize = kCSTitleFontsize,
  }) : super(
          _ControlWidget(
            fontSize: fontSize,
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
    Key? key,
    required this.fontSize,
    required this.contentWidget,
    required this.nameWidget,
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
          nameWidget,
          contentWidget,
        ],
      ),
    );
  }
}
