part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends StatelessWidget {
  /// The fontsize for the `title`.
  final double titleFontSize;

  /// The fontsize for the `subtitle`.
  final double subTitleFontSize;
  final String title;
  final String subtitle;
  final String detail;
  final Widget trailing;
  final VoidCallback onPressed;
  final CSWidgetStyle style;
  final CellType cellType;

  const CSLink({
    this.title,
    this.onPressed,
    this.subtitle,
    this.detail,
    this.style,
    this.titleFontSize,
    this.subTitleFontSize,
    this.trailing,
    this.cellType = CellType.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    final showSubtitle = (cellType == CellType.subtitleDetailStyle ||
            cellType == CellType.subtitleStyle) &&
        subtitle != null &&
        subtitle.isNotEmpty;
    final showDetail = (cellType == CellType.subtitleDetailStyle ||
            cellType == CellType.detailRightStyle) &&
        detail != null &&
        detail.isNotEmpty;

    return CSWidget(
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: basicTextStyle(context).copyWith(
                      color: CupertinoColors.label.resolveFrom(context),
                      fontSize: titleFontSize ?? CS_TITLE_FONT_SIZE,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showSubtitle) const SizedBox(height: 2),
                  if (showSubtitle)
                    Text(
                      subtitle,
                      style: basicTextStyle(context).copyWith(
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                        fontSize: subTitleFontSize ?? CS_SUBTITLE_FONT_SIZE,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                ],
              ),
            ),
            if (showDetail) ...[
              Text(
                detail,
                style: basicTextStyle(context).copyWith(
                  color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  fontSize: titleFontSize,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(width: 4),
            ],
            trailing ??
                (onPressed != null
                    ? Icon(
                        CupertinoIcons.right_chevron,
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                        size: 14,
                      )
                    : const SizedBox()),
          ],
        ),
      ),
      style: style,
    );
  }
}

enum CellType {
  /// Default Style with optional widget on left side and left-aligned title
  defaultStyle,

  /// Left-aligned title and left-aligned subtitle below
  subtitleStyle,

  /// Left-aligned title, left-aligned subtitle below and right-aligned detail
  subtitleDetailStyle,

  /// Left-aligned title and right-aligned detail
  detailRightStyle,

  /// right-aligned title and left-aligned detail
  detailLeftStyle,
}
