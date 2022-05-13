import 'enums/build_enums.dart';

class Constants {
  static Map<dynamic, dynamic> _config;

  static void setEnvironment(BuildEnvironment env) {
    switch (env) {
      case BuildEnvironment.DEV:
        _config = _Config.devConstants;
        break;

      case BuildEnvironment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get resourceServer {
    return _config[_Config.RES_SERVER];
  }

  static get resourceServerVersion {
    return _config[_Config.RES_SERVER_VERSION];
  }

  static get whereAmI {
    return _config[_Config.WHERE_AM_I];
  }

  static get debutMode {
    return _config[_Config.DEBUG_MODE];
  }
}

class _Config {
  static const RES_SERVER = "RES_SERVER";
  static const RES_SERVER_VERSION = "RES_SERVER_VERSION";
  static const WHERE_AM_I = "WHERE_AM_I";
  static const DEBUG_MODE = false;

  static Map<dynamic, dynamic> devConstants = {
    RES_SERVER: "penangone.yelobee.com",
    RES_SERVER_VERSION: "api",
    WHERE_AM_I: "DEVELOPMENT",
    DEBUG_MODE: true,
  };

  static Map<dynamic, dynamic> prodConstants = {
    RES_SERVER: "penangone.yelobee.com",
    RES_SERVER_VERSION: "api",
    WHERE_AM_I: "PRODUCTION",
    DEBUG_MODE: false,
  };
}
