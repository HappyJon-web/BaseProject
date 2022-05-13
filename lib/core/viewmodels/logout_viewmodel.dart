import 'package:baseproject/core/services/logout_service.dart';
import 'package:baseproject/core/services/request/request_logout.dart';
import 'package:baseproject/core/services/respond/res_logout.dart';
import 'package:baseproject/core/utilities/shared_pref_util.dart';
import 'package:baseproject/core/viewmodels/base_model.dart';
import 'package:baseproject/locator.dart';
import 'package:bot_toast/bot_toast.dart';

class LogoutViewModel extends BaseModel {
  LogoutService loginService = locator<LogoutService>();

  logout() async {
    bool status = false;
    String accessToken = await SharedPrefUtil().getToken();
    LogoutResponse logoutResponse =
        await loginService.logout(LogoutRequest(key: ""));
    BotToast.showText(text: logoutResponse.message);
    status = logoutResponse.status;
    if (status == true) {
      SharedPrefUtil().clear();
    }
    return status;
  }
}
