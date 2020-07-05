part of flutter_cupertino_settings;

/// Used to display a widget of any kind in [CupertinoSettings]
/// It provices the correct height, color and border to create the intended look
/// The optional [alignment] attribute allows to specify the aligment inside the container
/// The optional [style] attribute allows to specify a style (e.g. an Icon)
class CSWidget extends StatelessWidget {
  final CSWidgetStyle style;
  final double height;
  final Widget widget;

  const CSWidget(
    this.widget, {
    this.height = CS_ITEM_HEIGHT,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final DefaultCSWidgetTheme defaultCSWidgetTheme =
        DefaultCSWidgetTheme.of(context);

    final CSWidgetStyle effectiveWidgetStyle =
        defaultCSWidgetTheme.style.merge(style);

    Widget child;
    EdgeInsets padding;

    //style.icon
    if (effectiveWidgetStyle.icon != null) {
      padding = CS_ICON_PADDING;
      child = Row(
        children: <Widget>[
          Container(
            padding: CS_ICON_PADDING,
            child: effectiveWidgetStyle.icon,
          ),
          Expanded(child: widget)
        ],
      );
    } else {
      child = widget;
      padding = CS_ITEM_PADDING;
    }

    return Container(
      alignment: effectiveWidgetStyle.alignment,
      decoration: BoxDecoration(
        color: effectiveWidgetStyle.backgroundColor,
        border: Border(
          top: effectiveWidgetStyle.topBorder,
        ),
      ),
      constraints: const BoxConstraints(minHeight: 42),
      padding: EdgeInsets.only(
        left: effectiveWidgetStyle.addPaddingToBorder ? padding.left : 0,
      ),
      child: Container(
        padding: padding.copyWith(
          left: effectiveWidgetStyle.addPaddingToBorder ? 2 : padding.left + 2,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: effectiveWidgetStyle.bottomBorder,
          ),
        ),
        child: child,
      ),
    );
  }
}
