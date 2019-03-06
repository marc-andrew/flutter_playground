import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.onPressed,
    this.title,
  });

  final VoidCallback onPressed;
  final Widget title;
}

class CupertinoActionSheetActionData extends _BaseData {
  CupertinoActionSheetActionData({
    VoidCallback onPressed,
    Widget title,
    this.isDefaultAction,
    this.isDestructiveAction,
  }) : super(onPressed: onPressed, title: title);

  final bool isDefaultAction;
  final bool isDestructiveAction;
}

class MaterialActionSheetActionData extends _BaseData {
  MaterialActionSheetActionData({
    VoidCallback onPressed,
    Widget title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onLongPress,
    this.selected = false,
  }) : super(onPressed: onPressed, title: title);

  final Widget leading;
  final Widget subtitle;
  final Widget trailing;
  final bool isThreeLine;
  final bool dense;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final GestureLongPressCallback onLongPress;
  final bool selected;
}

class PlatformActionSheetAction
    extends PlatformWidget<CupertinoActionSheetAction, ListTile> {
  PlatformActionSheetAction({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.android,
    this.ios,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget title;
  final PlatformBuilder<CupertinoActionSheetActionData> ios;
  final PlatformBuilder<MaterialActionSheetActionData> android;

  @override
  CupertinoActionSheetAction buildCupertinoWidget(BuildContext context) {
    CupertinoActionSheetActionData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoActionSheetAction(
      child: data?.title ?? title,
      onPressed: data?.onPressed ?? onPressed,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
    );
  }

  @override
  ListTile buildAndroidWidget(BuildContext context) {
    MaterialActionSheetActionData data;
    if (android != null) {
      data = android(context);
    }

    return ListTile(
      title: data?.title ?? title,
      onTap: data?.onPressed ?? onPressed,
      leading: data?.leading,
      subtitle: data?.subtitle,
      trailing: data?.trailing,
      isThreeLine: data?.isThreeLine ?? false,
      dense: data?.dense,
      contentPadding: data?.contentPadding,
      enabled: data?.enabled ?? true,
      onLongPress: data?.onLongPress,
      selected: data?.selected ?? false,
    );
  }
}
