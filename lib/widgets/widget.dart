part of flutter_cupertino_settings;

/// Used to display a widget of any kind in [CupertinoSettings]
/// It provices the correct height, color and border to create the intended look
/// The optional [alignment] attribute allows to specify the aligment inside the container
/// The optional [style] attribute allows to specify a style (e.g. an Icon)
class CSWidget extends StatelessWidget {
  final AlignmentGeometry alignment;

  /// Default: false
  final bool addPaddingToBorder;

  /// Default: `BorderSide.none`
  final BorderSide topBorder;

  /// Default: `BorderSide(color: CupertinoColors.opaqueSeparator.resolveFrom(context), width: CS_BORDER_WIDTH)`
  final BorderSide bottomBorder;

  /// Default: CupertinoColors.secondarySystemGroupedBackground
  final Color backgroundColor;
  final CSWidgetStyle style;
  final double height;
  final Widget widget;

  const CSWidget(
    this.widget, {
    this.alignment,
    this.height = CS_ITEM_HEIGHT,
    this.style = CS_DEFAULT_STYLE,
    this.addPaddingToBorder,
    this.backgroundColor,
    this.topBorder,
    this.bottomBorder,
  });

  @override
  Widget build(BuildContext context) {
    Widget child;
    EdgeInsets padding;

    //style.icon
    if (style.icon != null) {
      padding = CS_ICON_PADDING;
      child = Row(
        children: <Widget>[
          Container(
            padding: CS_ICON_PADDING,
            child: style.icon,
          ),
          Expanded(child: widget)
        ],
      );
    } else {
      child = widget;
      padding = CS_ITEM_PADDING;
    }

    return Container(
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor ??
            CupertinoColors.secondarySystemGroupedBackground
                .resolveFrom(context),
        border: Border(
          top: topBorder ?? BorderSide.none,
        ),
      ),
      constraints: const BoxConstraints(minHeight: 42),
      padding: EdgeInsets.only(
        left: (addPaddingToBorder ?? false) ? padding.left : 0,
      ),
      child: Container(
        padding: padding.copyWith(
          left: (addPaddingToBorder ?? false) ? 2 : padding.left + 2,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: bottomBorder ??
                BorderSide(
                  color: CupertinoColors.opaqueSeparator.resolveFrom(context),
                  width: CS_BORDER_WIDTH,
                ),
          ),
        ),
        child: child,
      ),
    );
  }
}

/// Defines style attributes that can be applied to every [CSWidget]
class CSWidgetStyle {
  final Icon icon;

  const CSWidgetStyle({this.icon});
}
