part of flutter_cupertino_settings;

/// Defines style attributes that can be applied to every [CSWidget]
@immutable
class CSWidgetStyle with DiagnosticableMixin {
  final Icon icon;

  final AlignmentGeometry alignment;

  /// Default: false
  final bool addPaddingToBorder;

  /// Default: `BorderSide.none`
  final BorderSide topBorder;

  /// Default: `BorderSide(color: CupertinoColors.opaqueSeparator.resolveFrom(context), width: CS_BORDER_WIDTH)`
  final BorderSide bottomBorder;

  /// Default: CupertinoColors.secondarySystemGroupedBackground
  final Color backgroundColor;

  const CSWidgetStyle({
    this.alignment,
    this.addPaddingToBorder,
    this.topBorder,
    this.bottomBorder,
    this.backgroundColor,
    this.icon,
  });

  factory CSWidgetStyle.fallback(BuildContext context) => CSWidgetStyle(
        addPaddingToBorder: true,
        backgroundColor: CupertinoColors.secondarySystemGroupedBackground
            .resolveFrom(context),
        topBorder: BorderSide.none,
        bottomBorder: BorderSide(
          color: CupertinoColors.opaqueSeparator.resolveFrom(context),
          width: CS_BORDER_WIDTH,
        ),
      );

  CSWidgetStyle merge(CSWidgetStyle other) {
    if (other == null) return this;

    return copyWith(
      alignment: other.alignment,
      addPaddingToBorder: other.addPaddingToBorder,
      topBorder: other.topBorder,
      bottomBorder: other.bottomBorder,
      backgroundColor: other.backgroundColor,
      icon: other.icon,
    );
  }

  CSWidgetStyle copyWith({
    Icon icon,
    AlignmentGeometry alignment,
    bool addPaddingToBorder,
    BorderSide topBorder,
    BorderSide bottomBorder,
    Color backgroundColor,
  }) {
    return CSWidgetStyle(
      icon: icon ?? this.icon,
      alignment: alignment ?? this.alignment,
      addPaddingToBorder: addPaddingToBorder ?? this.addPaddingToBorder,
      topBorder: topBorder ?? this.topBorder,
      bottomBorder: bottomBorder ?? this.bottomBorder,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  String toStringShort() {
    return 'CSWidgetStyle(icon: $icon, alignment: $alignment, addPaddingToBorder: $addPaddingToBorder, topBorder: $topBorder, bottomBorder: $bottomBorder, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CSWidgetStyle &&
        o.icon == icon &&
        o.alignment == alignment &&
        o.addPaddingToBorder == addPaddingToBorder &&
        o.topBorder == topBorder &&
        o.bottomBorder == bottomBorder &&
        o.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode {
    return icon.hashCode ^
        alignment.hashCode ^
        addPaddingToBorder.hashCode ^
        topBorder.hashCode ^
        bottomBorder.hashCode ^
        backgroundColor.hashCode;
  }
}
