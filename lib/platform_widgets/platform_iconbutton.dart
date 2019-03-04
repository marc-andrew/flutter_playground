import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.color,
    this.disabledColor,
    this.padding,
    this.iconData,
    this.iconColor,
    this.iconSize,
    this.tooltip,
    this.onPressed,
  });

  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final String tooltip;
  final VoidCallback onPressed;
}

class CupertinoIconButtonData extends _BaseData {
  CupertinoIconButtonData({
    Color color,
    Color disabledColor,
    EdgeInsetsGeometry padding,
    IconData iconData,
    Color iconColor,
    double iconSize,
    String tooltip,
    VoidCallback onPressed,
    this.minSize,
    this.pressedOpacity,
    this.borderRadius,
  }) : super(
    color: color,
    disabledColor: disabledColor,
    padding: padding,
    iconData: iconData,
    iconColor: iconColor,
    iconSize: iconSize,
    tooltip: tooltip,
    onPressed: onPressed,
  );

  final double minSize;
  final double pressedOpacity;
  final BorderRadius borderRadius;
}

class MaterialIconButtonData extends _BaseData {
  MaterialIconButtonData({
    Color color,
    this.splashColor,
    this.highlightColor,
    Color disabledColor,
    EdgeInsetsGeometry padding,
    this.alignment,
    IconData iconData,
    Color iconColor,
    double iconSize,
    String tooltip,
    VoidCallback onPressed,
  }) : super(
    color: color,
    disabledColor: disabledColor,
    padding: padding,
    iconData: iconData,
    iconColor: iconColor,
    iconSize: iconSize,
    tooltip: tooltip,
    onPressed: onPressed,
  );

  final Color splashColor;
  final Color highlightColor;
  final AlignmentGeometry alignment;
}

class PlatformIconButton extends PlatformWidget<CupertinoButton, IconButton> {
  PlatformIconButton({
    Key key,
    this.color,
    this.disabledColor,
    this.padding = const EdgeInsets.all(0.0),
    @required this.iconData,
    this.iconColor,
    this.iconSize = 24.0,
    this.tooltip,
    @required this.onPressed,
    this.android,
    this.ios,
  }) : super(key: key);

  final Color color;
  final Color disabledColor;
  final EdgeInsetsGeometry padding;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;
  final String tooltip;
  final VoidCallback onPressed;
  final PlatformBuilder<MaterialIconButtonData> android;
  final PlatformBuilder<CupertinoIconButtonData> ios;

  @override
  CupertinoButton buildCupertinoWidget(BuildContext context) {
    CupertinoIconButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoButton(
      child: Semantics(
        container: true,
        excludeSemantics: true,
        label: data?.tooltip ?? tooltip,
        button: true,
        child: Icon(
          data?.iconData ?? iconData,
          color: data?.iconColor ?? iconColor,
          size: data?.iconSize ?? iconSize,
        ),
      ),
      padding: data?.padding ?? padding,
      color: data?.color ?? color,
      disabledColor: data?.disabledColor ?? disabledColor,
      onPressed: data?.onPressed ?? onPressed,
      minSize: data?.minSize ?? 44.0,
      pressedOpacity: data?.pressedOpacity ?? 1.0,
      borderRadius:
      data?.borderRadius ?? BorderRadius.all(Radius.circular(4.0)),
    );
  }

  @override
  IconButton buildAndroidWidget(BuildContext context) {
    MaterialIconButtonData data;
    if (android != null) {
      data = android(context);
    }

    return IconButton(
      color: data?.color ?? color,
      splashColor: data?.splashColor,
      highlightColor: data?.highlightColor,
      disabledColor: data?.disabledColor ?? disabledColor,
      padding: data?.padding ?? padding,
      alignment: data?.alignment ?? Alignment.center,
      icon: Icon(
        iconData,
        color: iconColor,
      ),
      iconSize: data?.iconSize ?? iconSize,
      tooltip: data?.tooltip ?? tooltip,
      onPressed: data?.onPressed ?? onPressed,
    );
  }
}
