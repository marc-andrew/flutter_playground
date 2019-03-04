import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'platform.dart';

PageRoute<T> platformPageRoute<T>({
  WidgetBuilder builder,
  RouteSettings settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String iosTitle,
}) {
  if (isIos) {
    return CupertinoPageRoute<T>(
        builder: builder,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        title: iosTitle);
  } else {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}