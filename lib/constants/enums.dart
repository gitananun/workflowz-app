enum AppMode { Dev, Debug, Release }
enum DeviceScreenSize { Small, Medium, Large }
enum DeviceScreenType { Mobile, Tablet, Desktop }

enum ValidationType { Base, Email, Password, Name, LastName, RepeatPassword }

enum ReportType { Start, End }

extension ReportTypeExtension on ReportType {
  String parseToString() => toString().split('.').last;
}
