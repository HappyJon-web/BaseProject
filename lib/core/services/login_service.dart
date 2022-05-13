import 'package:baseproject/core/services/request/request_login.dart';
import 'package:baseproject/core/services/respond/res_login.dart';

import '../../locator.dart';
import 'api.dart';

class LoginService {
  Api _api = locator<Api>();

  login(LoginRequest loginRequest) async {
    var respond = await _api.emailLogin(loginRequest);
    return loginResponseFromJson(respond.body);
  }
}
