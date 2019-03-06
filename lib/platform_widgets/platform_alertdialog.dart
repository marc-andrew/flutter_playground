import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.actions,
    this.content,
    this.title,
  });

  final List<Widget> actions;
  final Widget content;
  final Widget title;
}

class CupertinoAlertDialogData extends _BaseData {
  CupertinoAlertDialogData({
    List<Widget> actions,
    Widget content,
    Widget title,
    this.scrollController,
    this.actionScrollController,
  }) : super(actions: actions, content: content, title: title);

  final ScrollController scrollController;
  final ScrollController actionScrollController;
}

class MaterialAlertDialogData extends _BaseData {
  MaterialAlertDialogData({
    List<Widget> actions,
    Widget content,
    Widget title,
    this.contentTextStyle,
    this.titleTextStyle,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.contentPadding,
    this.semanticLabel,
    this.titlePadding,
  }) : super(actions: actions, content: content, title: title);

  final EdgeInsetsGeometry contentPadding;
  final String semanticLabel;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle titleTextStyle;
  final TextStyle contentTextStyle;
  final Color backgroundColor;
  final double elevation;
  final ShapeBorder shape;
}

class PlatformAlertDialog
    extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
  PlatformAlertDialog({
    Key key,
    this.actions,
    this.content,
    this.title,
    this.android,
    this.ios,
  }) : super(key: key);

  final List<Widget> actions;
  final Widget content;
  final Widget title;

  final PlatformBuilder<MaterialAlertDialogData> android;
  final PlatformBuilder<CupertinoAlertDialogData> ios;

  @override
  CupertinoAlertDialog buildCupertinoWidget(BuildContext context) {
    CupertinoAlertDialogData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoAlertDialog(
      title: data?.title ?? title,
      content: data?.content ?? content,
      actions: data?.actions ?? actions ?? const <Widget>[],
      scrollController: data?.scrollController,
      actionScrollController: data?.actionScrollController,
    );
  }

  @override
  AlertDialog buildAndroidWidget(BuildContext context) {
    MaterialAlertDialogData data;
    if (android != null) {
      data = android(context);
    }

    return AlertDialog(
      title: data?.title ?? title,
      titlePadding: data?.titlePadding,
      titleTextStyle: data?.titleTextStyle,
      content: data?.content ?? content,
      contentPadding: data?.contentPadding ??
          const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      contentTextStyle: data?.contentTextStyle,
      actions: data?.actions ?? actions,
      backgroundColor: data?.backgroundColor,
      elevation: data?.elevation,
      semanticLabel: data?.semanticLabel,
      shape: data?.shape,
    );
  }
}
