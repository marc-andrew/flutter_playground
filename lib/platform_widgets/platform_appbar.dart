import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

//the default has alpha which will cause the content to slide under the header for ios
const Color _kDefaultNavBarBorderColor = const Color(0x4C000000);

const Border _kDefaultNavBarBorder = const Border(
  bottom: const BorderSide(
    color: _kDefaultNavBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

abstract class _BaseData {
  _BaseData({
    this.title,
    this.backgroundColor,
    this.leading,
    this.automaticallyImplyLeading,
  });

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
  final bool automaticallyImplyLeading;
}

class CupertinoAppBarData extends _BaseData {
  CupertinoAppBarData(
      {Widget middle,
        Color backgroundColor,
        Widget leading,
        bool automaticallyImplyLeading,
        this.previousPageTitle,
        this.automaticallyImplyMiddle,
        this.padding,
        this.trailing,
        this.border,
        this.actionsForegroundColor,
        this.transitionBetweenRoutes,
        this.heroTag})
      : super(
      title: middle,
      backgroundColor: backgroundColor,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading);

  final Widget trailing;
  final Border border;
  final Color actionsForegroundColor;
  final bool transitionBetweenRoutes;
  final Object heroTag;
  final bool automaticallyImplyMiddle;
  final String previousPageTitle;
  final EdgeInsetsDirectional padding;
}

class MaterialAppBarData extends _BaseData {
  MaterialAppBarData(
      {Widget title,
        Color backgroundColor,
        Widget leading,
        bool automaticallyImplyLeading,
        this.actions,
        this.bottom,
        this.bottomOpacity,
        this.brightness,
        this.centerTitle,
        this.elevation,
        this.flexibleSpace,
        this.iconTheme,
        this.primary,
        this.textTheme,
        this.titleSpacing,
        this.toolbarOpacity})
      : super(
      title: title,
      backgroundColor: backgroundColor,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading);

  final List<Widget> actions;
  final PreferredSizeWidget bottom;

  final double bottomOpacity;
  final Brightness brightness;
  final bool centerTitle;
  final double elevation;
  final Widget flexibleSpace;
  final IconThemeData iconTheme;
  final bool primary;
  final TextTheme textTheme;
  final double titleSpacing;
  final double toolbarOpacity;
}

class PlatformAppBar
    extends PlatformWidget<CupertinoNavigationBar, PreferredSizeWidget> {
  PlatformAppBar({
    Key key,
    this.title,
    this.backgroundColor = Colors.white,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.android,
    this.ios,
  }) : super(key: key);

  final Widget title;
  final Color backgroundColor;
  final Widget leading;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final PlatformBuilder<MaterialAppBarData> android;
  final PlatformBuilder<CupertinoAppBarData> ios;

  @override
  CupertinoNavigationBar buildCupertinoWidget(BuildContext context) {
    CupertinoAppBarData data;
    if (ios != null) {
      data = ios(context);
    }

    var trailing = actions == null || actions.isEmpty
        ? null
        : Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: actions,
    );

    if (data?.heroTag != null) {
      return CupertinoNavigationBar(
        middle: data?.title ?? title,
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        actionsForegroundColor: data?.actionsForegroundColor,
        automaticallyImplyLeading:
        data?.automaticallyImplyLeading ?? automaticallyImplyLeading,
        automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
        previousPageTitle: data?.previousPageTitle,
        padding: data?.padding,
        border: data?.border ??
            Border(
              bottom: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
        leading: data?.leading ?? leading,
        trailing: data?.trailing ?? trailing,
        transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
        heroTag: data.heroTag,
      );
    }

    return CupertinoNavigationBar(
      middle: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      actionsForegroundColor: data?.actionsForegroundColor,
      automaticallyImplyLeading:
      data?.automaticallyImplyLeading ?? automaticallyImplyLeading,
      automaticallyImplyMiddle: data?.automaticallyImplyMiddle ?? true,
      previousPageTitle: data?.previousPageTitle,
      padding: data?.padding,
      border: data?.border ?? _kDefaultNavBarBorder,
      leading: data?.leading ?? leading,
      trailing: data?.trailing ?? trailing,
      transitionBetweenRoutes: data?.transitionBetweenRoutes ?? true,
    );
  }

  @override
  AppBar buildAndroidWidget(BuildContext context) {
    MaterialAppBarData data;
    if (android != null) {
      data = android(context);
    }

    return AppBar(
      title: data?.title ?? title,
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      bottom: data?.bottom,
      actions: data?.actions ?? actions,
      automaticallyImplyLeading:
      data?.automaticallyImplyLeading ?? automaticallyImplyLeading,
      bottomOpacity: data?.bottomOpacity ?? 1.0,
      brightness: data?.brightness,
      centerTitle: data?.centerTitle,
      elevation: data?.elevation ?? 0.5,
      flexibleSpace: data?.flexibleSpace,
      iconTheme: data?.iconTheme,
      leading: data?.leading ?? leading,
      primary: data?.primary ?? true,
      textTheme: data?.textTheme,
      titleSpacing: data?.titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: data?.toolbarOpacity ?? 1.0,
    );
  }
}
