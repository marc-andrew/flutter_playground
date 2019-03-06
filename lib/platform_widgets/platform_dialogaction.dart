import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;
}

class CupertinoDialogActionData extends _BaseData {
  CupertinoDialogActionData({
    Widget child,
    VoidCallback onPressed,
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  }) : super(child: child, onPressed: onPressed);

  final bool isDefaultAction;
  final bool isDestructiveAction;
  final TextStyle textStyle;
}

class MaterialDialogActionData extends _BaseData {
  MaterialDialogActionData({
    Widget child,
    VoidCallback onPressed,
    this.color,
    this.colorBrightness,
    this.disabledColor,
    this.disabledTextColor,
    this.highlightColor,
    this.onHighlightChanged,
    this.padding,
    this.shape,
    this.splashColor,
    this.textColor,
    this.textTheme,
    this.clipBehavior,
    this.materialTapTargetSize,
  }) : super(child: child, onPressed: onPressed);

  final Color color;
  final Brightness colorBrightness;
  final Color disabledColor;
  final Color disabledTextColor;
  final Color highlightColor;
  final ValueChanged<bool> onHighlightChanged;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Color splashColor;
  final Color textColor;
  final ButtonTextTheme textTheme;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
}

class PlatformDialogAction
    extends PlatformWidget<CupertinoDialogAction, FlatButton> {
  PlatformDialogAction({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.android,
    this.ios,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onPressed;
  final PlatformBuilder<MaterialDialogActionData> android;
  final PlatformBuilder<CupertinoDialogActionData> ios;

  @override
  CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
    CupertinoDialogActionData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoDialogAction(
      onPressed: data?.onPressed ?? onPressed,
      isDefaultAction: data?.isDefaultAction ?? false,
      isDestructiveAction: data?.isDestructiveAction ?? false,
      textStyle: data?.textStyle,
      child: data?.child ?? child,
    );
  }

  @override
  FlatButton buildAndroidWidget(BuildContext context) {
    MaterialDialogActionData data;
    if (android != null) {
      data = android(context);
    }

    return FlatButton(
      child: data?.child ?? child,
      padding: data?.padding,
      color: data?.color,
      disabledColor: data?.disabledColor,
      highlightColor: data?.highlightColor,
      splashColor: data?.splashColor,
      onPressed: data?.onPressed ?? onPressed,
      onHighlightChanged: data?.onHighlightChanged,
      textTheme: data?.textTheme,
      textColor: data?.textColor,
      disabledTextColor: data?.disabledTextColor,
      colorBrightness: data?.colorBrightness,
      shape: data?.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
      clipBehavior: data?.clipBehavior ?? Clip.none,
      materialTapTargetSize: data?.materialTapTargetSize,
    );
  }
}
