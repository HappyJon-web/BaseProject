import 'package:baseproject/core/services/login_service.dart';
import 'package:baseproject/core/services/request/request_login.dart';
import 'package:baseproject/core/services/respond/res_login.dart';
import 'package:baseproject/core/utilities/shared_pref_util.dart';
import 'package:baseproject/core/viewmodels/base_model.dart';
import 'package:baseproject/locator.dart';
import 'package:bot_toast/bot_toast.dart';

class LoginViewModel extends BaseModel {
  LoginService loginService = locator<LoginService>();

  login(String username, String password) async {
    bool status = false;
    // LoginResponse loginResponse = await loginService
    //     .login(LoginRequest(email: "testing@gmail.com", password: "123123"));

    LoginResponse loginResponse = await loginService
        .login(LoginRequest(username: username, password: password));
    BotToast.showText(text: loginResponse.message);
    status = loginResponse.status;
    if (status == true) {
      SharedPrefUtil().setToken("Bearer " + loginResponse.data.token);
    }
    return status;
  }
}
