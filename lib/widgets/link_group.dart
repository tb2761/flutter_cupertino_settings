part of flutter_cupertino_settings;

class CSLinkGroup extends StatelessWidget {
  final List<CSLink> items;

  /// A widget displayed above the items. Typically a `CSHeader`.
  final Widget header;

  /// A widget displayed below the items. Typically a `CSDescription`.
  final Widget description;
  final EdgeInsets padding;

  /// The `BorderRadius` applied to the Container holding the items.
  ///
  /// Default: `BorderRadius.circular(10)`
  final BorderRadius borderRadius;

  CSLinkGroup({
    Key key,
    this.items,
    this.header,
    this.description,
    this.padding,
    this.borderRadius,
  })  : assert(
          items != null && items.isNotEmpty,
          'Items can not be null or empty.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.1,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (header != null)
              if (header is CSHeader)
                CSHeader(
                  (header as CSHeader).title,
                  bottomBorder: BorderSide.none,
                )
              else
                header,
            ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: items.map<CSLink>((e) {
                  return CSLink(
                    addPaddingToBorder: e.addPaddingToBorder,
                    backgroundColor: e.backgroundColor,
                    cellType: e.cellType,
                    detail: e.detail,
                    onPressed: e.onPressed,
                    style: e.style,
                    subTitleFontSize: e.subTitleFontSize,
                    subtitle: e.subtitle,
                    title: e.title,
                    titleFontSize: e.titleFontSize,
                    trailing: e.trailing,
                    bottomBorder:
                        e == items.last ? BorderSide.none : e.bottomBorder,
                    topBorder: e == items.first ? BorderSide.none : e.topBorder,
                  );
                }).toList(),
              ),
            ),
            if (description != null) description,
          ],
        ),
      ),
    );
  }
}
