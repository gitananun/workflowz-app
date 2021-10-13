import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';

import '../../constants/api.dart';

abstract class AbstractApiRepository {
  final String baseUrl = Uri.parse(BASE_URL).toString();
  final String attachFileUrl = Uri.parse(BASE_URL.replaceFirst('app', 'files')).toString();
  final Uri saveReportUrl = Uri.parse('$BASE_URL/saveReport');
  final String updateSelfInfoUrl = Uri.parse('$BASE_URL/updateSelfInfo').toString();

  String getActUrl(int orderId, OrderActionEnums action) {
    final path = '$BASE_URL/act/$orderId/${action.parseToString()}';

    return Uri.parse(path).toString();
  }
}
