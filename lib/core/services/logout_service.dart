import 'package:baseproject/core/services/request/request_logout.dart';
import 'package:baseproject/core/services/respond/res_logout.dart';

import '../../locator.dart';
import 'api.dart';

class LogoutService {
  Api _api = locator<Api>();

  logout(LogoutRequest logoutRequest) async {
    var respond = await _api.logoutToken(logoutRequest);
    return logoutResponseFromJson(respond.body);
  }
}