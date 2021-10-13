import 'package:flutter/material.dart';

import '../../constants/enums.dart';

@immutable
mixin DeviceScreenMixin {
  static DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
    final Orientation orientation = mediaQuery.orientation;
    double deviceWidth = 0;

    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }

    if (deviceWidth > 950) {
      return DeviceScreenType.Desktop;
    }

    if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    }

    return DeviceScreenType.Mobile;
  }

  static DeviceScreenSize getDeviceScreenSize(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Orientation orientation = mediaQuery.orientation;
    double deviceWidth = 0;

    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQuery.size.height;
    } else {
      deviceWidth = mediaQuery.size.width;
    }

    if (deviceWidth > 500) {
      return DeviceScreenSize.Large;
    }
    if (deviceWidth > 320) {
      return DeviceScreenSize.Medium;
    }

    return DeviceScreenSize.Small;
  }
}
