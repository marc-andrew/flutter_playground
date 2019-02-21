import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';
import 'platform_appbar.dart';
import 'platform_navbar.dart';

abstract class _BaseData {
  _BaseData({this.backgroundColor, this.body});

  final Color backgroundColor;
  final Widget body;
}

class CupertinoPageScaffoldData extends _BaseData {
  CupertinoPageScaffoldData({
    Color backgroundColor,
    Widget body,
    this.navigationBar,
    this.resizeToAvoidBottomInset,
    this.tabBuilder,
  }) : super(backgroundColor: backgroundColor, body: body);

  final ObstructingPreferredSizeWidget navigationBar;
  final bool resizeToAvoidBottomInset;
  final IndexedWidgetBuilder tabBuilder;
}

class MaterialScaffoldData extends _BaseData {
  MaterialScaffoldData(
      {Color backgroundColor,
        Widget body,
        this.appBar,
        this.bottomNavBar,
        this.drawer,
        this.endDrawer,
        this.floatingActionButton,
        this.floatingActionButtonAnimator,
        this.floatingActionButtonLocation,
        this.persistentFooterButtons,
        this.primary,
        this.resizeToAvoidBottomPadding,
        this.bottomSheet})
      : super(backgroundColor: backgroundColor, body: body);

  final PreferredSizeWidget appBar;
  final Widget bottomNavBar;
  final Widget drawer;
  final Widget endDrawer;
  final Widget floatingActionButton;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final List<Widget> persistentFooterButtons;
  final bool primary;
  final bool resizeToAvoidBottomPadding;
  final Widget bottomSheet;
}

class PlatformScaffold extends PlatformWidget<Widget, Scaffold> {
  PlatformScaffold({
    Key key,
    this.appBar,
    this.body,
    this.bottomNavBar,
    this.backgroundColor,
    this.android,
    this.ios,
  }) : super(key: key);

  final PlatformAppBar appBar;
  final Widget body;
  final PlatformNavBar bottomNavBar;
  final Color backgroundColor;
  final PlatformBuilder<MaterialScaffoldData> android;
  final PlatformBuilder<CupertinoPageScaffoldData> ios;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    CupertinoPageScaffoldData data;
    if (ios != null) {
      data = ios(context);
    }

    Widget child;

    if(bottomNavBar != null) {
      var tabBar = bottomNavBar.buildCupertinoWidget(context);

      child = CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: data?.tabBuilder,
      );

    } else {
      child = CupertinoPageScaffold(
        backgroundColor: data?.backgroundColor ?? backgroundColor,
        navigationBar: data?.navigationBar ?? appBar?.buildCupertinoWidget(context),
        child: data?.body ?? body,
        resizeToAvoidBottomInset: data?.resizeToAvoidBottomInset ?? true,
      );
    }

    return child;
  }

  @override
  Scaffold buildAndroidWidget(BuildContext context) {
    MaterialScaffoldData data;
    if (android != null) {
      data = android(context);
    }

    return Scaffold(
      backgroundColor: data?.backgroundColor ?? backgroundColor,
      appBar: appBar?.buildAndroidWidget(context),
      body: data?.body ?? body,
      bottomNavigationBar: data?.bottomNavBar ?? bottomNavBar.buildAndroidWidget(context),
      drawer: data?.drawer,
      endDrawer: data?.endDrawer,
      floatingActionButton: data?.floatingActionButton,
      floatingActionButtonAnimator: data?.floatingActionButtonAnimator,
      floatingActionButtonLocation: data?.floatingActionButtonLocation,
      persistentFooterButtons: data?.persistentFooterButtons,
      primary: data?.primary ?? true,
      resizeToAvoidBottomPadding: data?.resizeToAvoidBottomPadding ?? true,
      bottomSheet: data?.bottomSheet,
    );
  }
}
