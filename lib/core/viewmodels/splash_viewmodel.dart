import 'package:baseproject/core/utilities/shared_pref_util.dart';
import 'package:baseproject/core/viewmodels/base_model.dart';

enum LoginCheck { StartUp, Home }

class SplashViewModel extends BaseModel {
  loginCheck() async {
    LoginCheck loginCheck = LoginCheck.StartUp;
    try {
      await Future.delayed(Duration(milliseconds: 500));
      String accessToken = await SharedPrefUtil().getToken();
      if (accessToken == null) {
        loginCheck = LoginCheck.StartUp;
      } else {
        loginCheck = LoginCheck.Home;
      }
    } catch (error, stackTrace) {
      loginCheck = LoginCheck.StartUp;
    }
//Return enum for View to know which View to Navigate to.
    return loginCheck;
  }
}
