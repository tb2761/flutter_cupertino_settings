part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends StatelessWidget {
  /// The fontsize for the `title`.
  final double titleFontSize;

  /// The fontsize for the `subtitle`.
  final double subTitleFontSize;
  final String title;
  final String? subtitle;
  final String? detail;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final CSWidgetStyle? style;
  final CellType cellType;
  final int subtitleMaxLines;

  const CSLink({
    required this.title,
    this.onPressed,
    this.subtitle,
    this.detail,
    this.style,
    this.titleFontSize = kCSTitleFontsize,
    this.subTitleFontSize = kCSSubtitleFontsize,
    this.trailing,
    this.cellType = CellType.defaultStyle,
    this.subtitleMaxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final showSubtitle = (cellType == CellType.subtitleDetailStyle ||
            cellType == CellType.subtitleStyle) &&
        subtitle != null &&
        subtitle!.isNotEmpty;
    final showDetail = (cellType == CellType.subtitleDetailStyle ||
            cellType == CellType.detailRightStyle) &&
        detail != null &&
        detail!.isNotEmpty;

    return CSWidget(
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: showSubtitle
                        ? CupertinoTheme.of(context).textTheme.textStyle.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                        : CupertinoTheme.of(context).textTheme.textStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showSubtitle) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style:
                          CupertinoTheme.of(context).textTheme.textStyle.merge(
                                TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.secondaryLabel
                                      .resolveFrom(context),
                                ),
                              ),
                      maxLines: subtitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            if (showDetail) ...[
              Text(
                detail!,
                style: CupertinoTheme.of(context).textTheme.textStyle.merge(
                      TextStyle(
                        color:
                            CupertinoColors.secondaryLabel.resolveFrom(context),
                      ),
                    ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(width: 4),
            ],
            if (trailing != null)
              trailing!
            else if (onPressed != null)
              Icon(
                CupertinoIcons.right_chevron,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
                size: CupertinoTheme.of(context).textTheme.textStyle.fontSize,
              ),
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
