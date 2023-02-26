library flutter_cupertino_settings;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme;
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
part 'widgets/section.dart';
part 'widgets/widget.dart';
part 'widgets/widget_theme.dart';

const double kCSItemHeight = 50.0;
const EdgeInsets kCSItemPadding = EdgeInsets.symmetric(
  horizontal: 10,
  vertical: 1,
);
const double kCSTitleFontsize = 16.0;
const double kCSSubtitleFontsize = 11.0;
const double kCSHeaderFontsize = 14.0;
const double kCSDescriptionFontsize = 13.0;
const double kCSItemNameSize = 15.0;
const EdgeInsets kCSIconPadding = EdgeInsets.only(
  right: 10.0,
  left: 4.0,
);

/// Event for [CSSelection]
typedef SelectionCallback = void Function(int selected);

TextStyle basicTextStyle(BuildContext context) {
  if (kIsWeb) {
    return Theme.of(context).textTheme.titleMedium!;
  } else if (Platform.isIOS || Platform.isMacOS) {
    return CupertinoTheme.of(context).textTheme.textStyle;
  } else {
    return Theme.of(context).textTheme.titleMedium!;
  }
}

BorderSide kCupertinoBorderSide(BuildContext context) => BorderSide(
      color: CupertinoColors.opaqueSeparator.resolveFrom(context),
      width: 1 / MediaQuery.of(context).devicePixelRatio,
    );

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  final bool shrinkWrap;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? primary;
  final EdgeInsetsGeometry? padding;
  final bool reverse;
  final Axis scrollDirection;

  const CupertinoSettings({
    required this.items,
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
      style: CSWidgetStyle.fallback(context),
      child: ColoredBox(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        child: SafeArea(
          bottom: false,
          child: shrinkWrap
              ? ListView.builder(
                  controller: controller,
                  shrinkWrap: shrinkWrap,
                  itemCount: items.length,
                  itemBuilder: (context, index) => items[index],
                  padding: padding,
                  primary: primary,
                  physics: physics,
                  reverse: reverse,
                  scrollDirection: scrollDirection,
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        shrinkWrap: shrinkWrap,
                        itemCount: items.length,
                        itemBuilder: (context, index) => items[index],
                        padding: padding,
                        primary: primary,
                        physics: physics,
                        reverse: reverse,
                        scrollDirection: scrollDirection,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
