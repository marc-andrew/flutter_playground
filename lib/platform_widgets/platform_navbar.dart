import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

const Color _kDefaultTabBarBorderColor = Color(0x4C000000);

const Border _kDefaultNavBarBorder = const Border(
  top: BorderSide(
    color: _kDefaultTabBarBorderColor,
    width: 0.0, // One physical pixel.
    style: BorderStyle.solid,
  ),
);

abstract class _BaseData {
  _BaseData({
    this.items,
    this.iconSize,
    this.currentIndex,
    this.onTap,
  });

  final List<BottomNavigationBarItem> items;
  final double iconSize;
  final int currentIndex;
  final ValueChanged<int> onTap;
}

class CupertinoTabBarData extends _BaseData {
  CupertinoTabBarData({
    List<BottomNavigationBarItem> items,
    ValueChanged<int> onTap,
    double iconSize,
    int currentIndex,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.border,
  }) : super(
      items: items,
      iconSize: iconSize,
      currentIndex: currentIndex,
      onTap: onTap);

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Border border;
}

class MaterialNavBarData extends _BaseData {
  MaterialNavBarData({
    List<BottomNavigationBarItem> items,
    ValueChanged<int> onTap,
    double iconSize,
    int currentIndex,
    this.type,
    this.fixedColor,
  }) : super(
      items: items,
      iconSize: iconSize,
      currentIndex: currentIndex,
      onTap: onTap);

  final BottomNavigationBarType type;
  final Color fixedColor;
}

class PlatformNavBar
    extends PlatformWidget<CupertinoTabBar, BottomNavigationBar> {
  PlatformNavBar({
    @required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.android,
    this.ios,
  });

  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;
  final PlatformBuilder<MaterialNavBarData> android;
  final PlatformBuilder<CupertinoTabBarData> ios;

  @override
  CupertinoTabBar buildCupertinoWidget(BuildContext context) {
    CupertinoTabBarData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoTabBar(
      items: data?.items ?? items,
      onTap: data?.onTap ?? onTap,
      currentIndex: data?.currentIndex ?? currentIndex,
      backgroundColor: data?.backgroundColor ?? CupertinoColors.white,
      activeColor: data?.activeColor,
      inactiveColor: data?.inactiveColor ?? CupertinoColors.inactiveGray,
      iconSize: data?.iconSize ?? 30.0,
      border: data?.border ?? _kDefaultNavBarBorder,
    );
  }

  @override
  BottomNavigationBar buildAndroidWidget(BuildContext context) {
    MaterialNavBarData data;
    if (android != null) {
      data = android(context);
    }

    return BottomNavigationBar(
      items: data?.items ?? items,
      onTap: data?.onTap ?? onTap,
      currentIndex: data?.currentIndex ?? currentIndex,
      iconSize: data?.iconSize ?? 24.0,
      fixedColor: data?.fixedColor,
      type: data?.type,
    );
  }
}
