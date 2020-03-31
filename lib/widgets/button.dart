part of flutter_cupertino_settings;

/// A button-cell inside [CupertinoSettings]
/// 3 different types are available (they only affect the design):
/// [CSButtonType.DESTRUCTIVE] Red and centered
/// [CSButtonType.DEFAULT] Blue and left aligned
/// [CSButtonType.DEFAULT_CENTER] Blue and centered
/// Provides the correct paddings and text properties
///
/// It is quite complex:
///
/// -- Widget
///   |- Flex
///     |- Expand
///       |- CupertinoButton
///         |- Container        (<--- For text-alignment)
///           |- Text
///
/// This "hack" is mandatory to archive that...
/// 1) The button can be aligned
/// 2) The entire row is touch-sensitive
class CSButton extends CSWidget {
  /// Default: CS_TITLE_FONT_SIZE which is actually 16.0
  final double fontSize;
  final CSButtonType buttonType;
  final VoidCallback pressed;
  final Widget child;

  CSButton({
    @required this.child,
    @required this.pressed,
    @required this.buttonType,
    this.fontSize,
    CSWidgetStyle style,
    Color backgroundColor,
    bool addPaddingToBorder,
    bool showTopBorder,
  })  : assert(child != null),
        super(
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: pressed,
                  child: Container(
                    alignment: (buttonType ?? CSButtonType.DEFAULT).alignment,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: (buttonType ?? CSButtonType.DEFAULT).color,
                        fontSize: fontSize ?? CS_TITLE_FONT_SIZE,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
          style: style ?? CS_DEFAULT_STYLE,
          backgroundColor: backgroundColor,
          addPaddingToBorder: addPaddingToBorder,
          showTopBorder: showTopBorder,
        );
}

/// Defines different types for [CSButton]
/// Specifies color and alignment
class CSButtonType {
  static const CSButtonType DESTRUCTIVE = CSButtonType(
    CupertinoColors.destructiveRed,
    AlignmentDirectional.center,
  );
  static const CSButtonType DEFAULT = CSButtonType(
    CupertinoColors.systemBlue,
    AlignmentDirectional.centerStart,
  );
  static const CSButtonType DEFAULT_CENTER = CSButtonType(
    CupertinoColors.systemBlue,
    AlignmentDirectional.center,
  );

  final Color color;
  final AlignmentGeometry alignment;

  const CSButtonType(this.color, this.alignment);
}
