import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

const double _kNavBarBackButtonTapWidth = 50.0;

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

class CupertinoBackButtonData extends _BaseData {
  CupertinoBackButtonData({
    Color color,
    Color disabledColor,
    EdgeInsetsGeometry padding,
    IconData iconData,
    Color iconColor,
    double iconSize,
    String tooltip,
    VoidCallback onPressed,
    this.previousPageTitle,
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

  final String previousPageTitle;
  final double minSize;
  final double pressedOpacity;
  final BorderRadius borderRadius;
}

class MaterialBackButtonData extends _BaseData {
  MaterialBackButtonData({
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

class PlatformBackButton extends PlatformWidget<CupertinoButton, IconButton> {
  PlatformBackButton({
    Key key,
    this.color = Colors.transparent,
    this.disabledColor,
    this.padding,
    this.iconData = Icons.arrow_back_ios,
    this.iconColor,
    this.iconSize = 24.0,
    this.tooltip = 'Go Back',
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
  final PlatformBuilder<MaterialBackButtonData> android;
  final PlatformBuilder<CupertinoBackButtonData> ios;

  @override
  CupertinoButton buildCupertinoWidget(BuildContext context) {
    CupertinoBackButtonData data;
    if (ios != null) {
      data = ios(context);
    }

    TextStyle actionTextStyle = CupertinoTheme.of(context).textTheme.navActionTextStyle;
    if (color != null) {
      actionTextStyle = actionTextStyle.copyWith(color: color);
    }

    List<Widget> buttonChildren = [
      Padding(padding: EdgeInsetsDirectional.only(start: 8.0)),
      Icon(
        data?.iconData ?? iconData,
        color: data?.iconColor ?? iconColor ?? CupertinoColors.activeBlue,
        size: data?.iconSize ?? iconSize,
      ),
    ];

    if(data?.previousPageTitle != null) {
      buttonChildren.add(
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              widthFactor: 1.0,
              child: Text(
                data?.previousPageTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
      );
    }

    return CupertinoButton(
      child: Semantics(
        container: true,
        excludeSemantics: true,
        label: data?.tooltip ?? tooltip,
        button: true,
        child: DefaultTextStyle(
          style: actionTextStyle,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: _kNavBarBackButtonTapWidth),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: buttonChildren,
            ),
          ),
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
    MaterialBackButtonData data;
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
