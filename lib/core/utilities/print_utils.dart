import 'dart:convert';

import 'package:logger/logger.dart';

class Log {
  static printJson(Map<String, dynamic> json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    logger.v(prettyprint);
  }

  static betterPrintJson(responseBody) {
    try {
      var decodedJson = json.decode(responseBody);
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(decodedJson);
      logger.v(prettyprint);
    } on FormatException catch (error) {
      logger.d(error, "JSON DECODE EXCEPTION");
    }
  }

  static printError(error, StackTrace stackTrace) {
    logger.e(error, "ERROR", stackTrace);
    // print(stackTrace);
  }
}

final logger = Logger(
  // filter: null,
  // output: null,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 4,
    lineLength: 100,
    colors: false,
    printEmojis: true,
    printTime: false,
  ),
);
