part of flutter_cupertino_settings;

class CSDescription extends StatelessWidget {
  final String description;
  final Color backgroundColor;

  const CSDescription(
    this.description, {
    this.backgroundColor,
  }) : assert(description != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 7.5, 5, 5),
      color: backgroundColor ??
          CupertinoColors.systemGroupedBackground.resolveFrom(context),
      child: Text(
        description,
        style: basicTextStyle(context).copyWith(
          color: CupertinoColors.secondaryLabel.resolveFrom(context),
          fontSize: kCSDescriptionFontsize,
          height: 1.1,
        ),
      ),
    );
  }
}
