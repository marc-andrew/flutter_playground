import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.child,
    this.color,
    this.disabledColor,
    this.padding,
    this.onPressed,
  });

  final Widget child;
  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
}

class CupertinoButtonData extends _BaseData {
  CupertinoButtonData({
    Widget child,
    EdgeInsetsGeometry padding,
    Color color,
    Color disabledColor,
    this.minSize,
    this.pressedOpacity,
    this.borderRadius,
    VoidCallback onPressed,
  }) : super(
    child: child,
    color: color,
    disabledColor: disabledColor,
    padding: padding,
    onPressed: onPressed,
  );

  final double minSize;
  final double pressedOpacity;
  final BorderRadius borderRadius;
}

class MaterialFlatButtonData extends _BaseData {
  MaterialFlatButtonData({
    Widget child,
    EdgeInsetsGeometry padding,
    Color color,
    Color disabledColor,
    this.highlightColor,
    this.splashColor,
    VoidCallback onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.colorBrightness,
    this.shape,
    this.clipBehavior,
    this.materialTapTargetSize,
  }) : super(
    child: child,
    color: color,
    disabledColor: disabledColor,
    padding: padding,
    onPressed: onPressed,
  );

  final Color highlightColor;
  final Color splashColor;
  final ValueChanged<bool> onHighlightChanged;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Brightness colorBrightness;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
}

class PlatformButton extends PlatformWidget<CupertinoButton, FlatButton> {
  PlatformButton(
      {Key key,
        @required this.child,
        @required this.onPressed,
        this.color ,
        this.disabledColor,
        this.padding = const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 11.0),
        this.android,
        this.ios})
      : super(key: key);

  final Widget child;
  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final PlatformBuilder<MaterialFlatButtonData> android;
  final PlatformBuilder<CupertinoButtonData> ios;

  @override
  CupertinoButton buildCupertinoWidget(BuildContext context) {
    CupertinoButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoButton(
      color: data?.color ?? color,
      disabledColor: data?.disabledColor ?? disabledColor,
      padding: data?.padding ?? padding,
      borderRadius:
      data?.borderRadius ?? BorderRadius.all(Radius.circular(4.0)),
      pressedOpacity: data?.pressedOpacity ?? 1.0,
      minSize: data?.minSize ?? 44.0,
      child: data?.child ?? child,
      onPressed: data?.onPressed ?? onPressed,
    );
  }

  @override
  FlatButton buildAndroidWidget(BuildContext context) {
    MaterialFlatButtonData data;
    if (android != null) {
      data = android(context);
    }

    return FlatButton(
      child: data?.child ?? child,
      padding: data?.padding ?? padding,
      color: data?.color ?? color,
      disabledColor: data?.disabledColor ?? disabledColor,
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
