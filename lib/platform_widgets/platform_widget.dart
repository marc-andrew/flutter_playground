import 'dart:io';
import 'package:flutter/widgets.dart';

typedef T PlatformBuilder<T>(BuildContext context);

abstract class PlatformWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  PlatformWidget({Key key}) : super(key: key);

  I buildCupertinoWidget(BuildContext context);
  A buildAndroidWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      // Use Cupertino on iOS
      return buildCupertinoWidget(context);
    } else if(Platform.isAndroid) {
      // Use Material design on Android and other platforms
      return buildAndroidWidget(context);
    }

    return throw new UnsupportedError('This platform is not supported: ' + Platform.operatingSystem);
  }
}