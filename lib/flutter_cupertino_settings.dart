library flutter_cupertino_settings;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

part 'style.dart';
part 'widgets/button.dart';
part 'widgets/control.dart';
part 'widgets/description.dart';
part 'widgets/header.dart';
part 'widgets/link.dart';
part 'widgets/secret.dart';
part 'widgets/selection.dart';
part 'widgets/spacer.dart';
part 'widgets/widget.dart';
part 'widgets/widget_group.dart';
part 'widgets/widget_theme.dart';

const double CS_ITEM_HEIGHT = 50.0;
const EdgeInsets CS_ITEM_PADDING =
    EdgeInsets.symmetric(horizontal: 10, vertical: 1);
const double CS_TITLE_FONT_SIZE = 16.0;
const double CS_SUBTITLE_FONT_SIZE = 11.0;
const double CS_HEADER_FONT_SIZE = 14.0;
const double CS_DESCRIPTION_FONT_SIZE = 13.0;
const double CS_ITEM_NAME_SIZE = 15.0;
const EdgeInsets CS_ICON_PADDING = EdgeInsets.only(
  right: 10.0,
  left: 4.0,
);
const double CS_CHECK_SIZE = 28.0;
const double CS_BORDER_WIDTH = 0.75;

/// Event for [CSSelection]
typedef void SelectionCallback(int selected);

TextStyle basicTextStyle(BuildContext context) {
  if (kIsWeb) {
    return Theme.of(context).textTheme.subtitle1;
  } else if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoTheme.of(context).textTheme.textStyle;
  } else {
    return Theme.of(context).textTheme.subtitle1;
  }
}

BorderSide kCupertinoBorderSide(BuildContext context) => BorderSide(
      color: CupertinoColors.opaqueSeparator.resolveFrom(context),
      width: CS_BORDER_WIDTH,
    );

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  final bool shrinkWrap;
  final ScrollController controller;
  final ScrollPhysics physics;
  final bool primary;
  final EdgeInsetsGeometry padding;
  final bool reverse;
  final Axis scrollDirection;

  const CupertinoSettings({
    @required this.items,
    this.shrinkWrap = false,
    this.controller,
    this.physics,
    this.primary,
    this.padding,
    this.reverse = false,
    this.scrollDirection = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultCSWidgetTheme(
      height: CS_ITEM_HEIGHT,
      style: CSWidgetStyle.fallback(context),
      child: Container(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        child: SafeArea(
          bottom: false,
          child: shrinkWrap
              ? ListView.builder(
                  controller: controller,
                  shrinkWrap: shrinkWrap,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      items[index],
                  padding: padding,
                  primary: primary,
                  physics: physics,
                  reverse: reverse ?? false,
                  scrollDirection: scrollDirection ?? Axis.vertical,
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        shrinkWrap: shrinkWrap,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) =>
                            items[index],
                        padding: padding,
                        primary: primary,
                        physics: physics,
                        reverse: reverse ?? false,
                        scrollDirection: scrollDirection ?? Axis.vertical,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
