import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.actions,
  });

  final List<Widget> actions;
}

class CupertinoBottomSheetData extends _BaseData {
  CupertinoBottomSheetData({
    List<Widget> actions,
    this.title,
    this.message,
    this.messageScrollController,
    this.actionScrollController,
    this.cancelButton,
  }) : super(actions: actions);

  final Widget title;
  final Widget message;
  final ScrollController messageScrollController;
  final ScrollController actionScrollController;
  final Widget cancelButton;
}

class MaterialBottomSheetData extends _BaseData {
  MaterialBottomSheetData({
    List<Widget> actions,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  }) : super(actions: actions);

  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Decoration decoration;
  final Decoration foregroundDecoration;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
}

class PlatformBottomSheet
    extends PlatformWidget<CupertinoActionSheet, Container> {
  PlatformBottomSheet({
    Key key,
    @required this.actions,
    this.android,
    this.ios,
  }) : super(key: key);

  final List<Widget> actions;
  final PlatformBuilder<CupertinoBottomSheetData> ios;
  final PlatformBuilder<MaterialBottomSheetData> android;

  @override
  CupertinoActionSheet buildCupertinoWidget(BuildContext context) {
    CupertinoBottomSheetData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoActionSheet(
      title: data?.title,
      message: data?.message,
      messageScrollController: data?.messageScrollController,
      actionScrollController: data?.actionScrollController,
      actions: data?.actions ?? actions,
      cancelButton: data?.cancelButton,
    );
  }

  @override
  Container buildAndroidWidget(BuildContext context) {
    MaterialBottomSheetData data;
    if (android != null) {
      data = android(context);
    }

    return Container(
      alignment: data?.alignment,
      padding: data?.padding ?? EdgeInsets.only(bottom: 34.0),
      color: data?.color,
      decoration: data?.decoration,
      foregroundDecoration: data?.foregroundDecoration,
      child: Column(
        mainAxisAlignment: data?.mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: data?.mainAxisSize ?? MainAxisSize.min,
        crossAxisAlignment: data?.crossAxisAlignment ?? CrossAxisAlignment.center,
        textDirection: data?.textDirection,
        verticalDirection: data?.verticalDirection ?? VerticalDirection.down,
        textBaseline: data?.textBaseline,
        children: actions,
      ),
    );
  }
}
