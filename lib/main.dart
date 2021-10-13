import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: AppMixin.getDevicePreviewStatus(APP_MODE),
    //   builder: (context) => AppOriginator(),
    // ),
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: App(),
    ),
  );
}
