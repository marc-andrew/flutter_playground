import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Widgets
import 'platform_widget.dart';

abstract class _BaseData {
  _BaseData({
    this.value,
    this.onChanged,
    this.activeColor,
  });

  final bool value;
  final Color activeColor;
  final ValueChanged<bool> onChanged;
}

class CupertinoSwitchData extends _BaseData {
  CupertinoSwitchData({
    bool value,
    ValueChanged<bool> onChanged,
    Color activeColor,
  }) : super(
    value: value,
    onChanged: onChanged,
    activeColor: activeColor,
  );
}

class MaterialSwitchData extends _BaseData {
  MaterialSwitchData({
    bool value,
    ValueChanged<bool> onChanged,
    Color activeColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.materialTapTargetSize,
  }) : super(
    value: value,
    onChanged: onChanged,
    activeColor: activeColor,
  );

  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final ImageProvider activeThumbImage;
  final ImageProvider inactiveThumbImage;
  final MaterialTapTargetSize materialTapTargetSize;
}

class PlatformSwitch extends PlatformWidget<CupertinoSwitch, Switch> {
  PlatformSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.activeColor,
    this.android,
    this.ios,
  }) : super(key: key);

  final Color activeColor;
  final bool value;
  final ValueChanged<bool> onChanged;

  final PlatformBuilder<MaterialSwitchData> android;
  final PlatformBuilder<CupertinoSwitchData> ios;

  @override
  CupertinoSwitch buildCupertinoWidget(BuildContext context) {
    CupertinoSwitchData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoSwitch(
      activeColor: data?.activeColor ?? activeColor,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
    );
  }

  @override
  Switch buildAndroidWidget(BuildContext context) {
    MaterialSwitchData data;
    if (android != null) {
      data = android(context);
    }

    return Switch(
      activeColor: data?.activeColor ?? activeColor,
      value: data?.value ?? value,
      onChanged: data?.onChanged ?? onChanged,
      activeThumbImage: data?.activeThumbImage,
      activeTrackColor: data?.activeTrackColor,
      inactiveThumbColor: data?.inactiveThumbColor,
      inactiveThumbImage: data?.inactiveThumbImage,
      inactiveTrackColor: data?.inactiveTrackColor,
      materialTapTargetSize: data?.materialTapTargetSize,
    );
  }
}
