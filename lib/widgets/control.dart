part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final Widget nameWidget;
  final Widget contentWidget;
  final double fontSize;

  CSControl({
    this.nameWidget,
    this.contentWidget,
    CSWidgetStyle style,
    this.fontSize,
    bool addPaddingToBorder,
    bool showTopBorder,
    Color backgroundColor,
  }) : super(
          _ControlWidget(
            fontSize: fontSize ?? CS_TITLE_FONT_SIZE,
            contentWidget: contentWidget,
            nameWidget: nameWidget,
          ),
          style: style ?? CS_DEFAULT_STYLE,
          addPaddingToBorder: addPaddingToBorder ?? true,
          showTopBorder: showTopBorder ?? false,
          backgroundColor: backgroundColor,
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
