import '../../constants/enums.dart';

mixin AppMixin {
  static bool getDevicePreviewStatus(AppMode appMode) => appMode == AppMode.Dev;
}
