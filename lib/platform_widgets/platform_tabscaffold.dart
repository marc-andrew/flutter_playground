import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';
import 'platform_appbar.dart';
import 'platform_navbar.dart';

abstract class _BaseData {
  _BaseData({this.backgroundColor});

  final Color backgroundColor;
}

class CupertinoPageScaffoldData extends _BaseData {
  CupertinoPageScaffoldData({
    Color backgroundColor,
    this.navigationBar,
    this.resizeToAvoidBottomInset,
    this.tabBuilder,
  }) : super(backgroundColor: backgroundColor);

  final ObstructingPreferredSizeWidget navigationBar;
  final bool resizeToAvoidBottomInset;
  final IndexedWidgetBuilder tabBuilder;
}

class PlatformTabScaffold
    extends PlatformWidget<CupertinoTabScaffold, Scaffold> {
  PlatformTabScaffold({
    Key key,
    this.appBarList,
    this.bodyList,
    this.bottomNavBar,
    this.backgroundColor,
  }) : super(key: key);

  final List<PlatformAppBar> appBarList;
  final List<Widget> bodyList;
  final PlatformNavBar bottomNavBar;
  final Color backgroundColor;
}
