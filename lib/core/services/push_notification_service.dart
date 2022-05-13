// import 'dart:io';

// import 'package:BaseProject/core/services/api.dart';
// import 'package:BaseProject/core/services/request/req_fcm_token.dart';
// import 'package:BaseProject/core/utilities/print_utils.dart';
// import 'package:BaseProject/ui/ui_helper/color.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../locator.dart';

// class ReceivedNotification {
//   final int id;
//   final String title;
//   final String body;
//   final String payload;

//   ReceivedNotification({
//     @required this.id,
//     @required this.title,
//     @required this.body,
//     @required this.payload,
//   });
// }

// class PushNotificationService {
//   Api _api = locator<Api>();
//   final FirebaseMessaging _fcm = FirebaseMessaging.instance;

//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestPermission();
//     }

//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) async {
//         RemoteNotification notification = message.notification;

//         if (Platform.isAndroid) {
//           BotToast.showNotification(
//             duration: Duration(seconds: 2),
//             backgroundColor: Colors.white,
//             leading: (cancel) => SizedBox.fromSize(
//               size: const Size(30, 30),
//               child: ImageIcon(
//                 AssetImage("assets/final_logo_1.png"),
//                 color: primaryLightColor,
//               ),
//             ),
//             title: (_) => Text(notification.title,
//                 style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold)),
//             subtitle: (_) => Text(
//               notification.body,
//               style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal),
//             ),
//           );
//         } else if (Platform.isIOS) {
//           BotToast.showNotification(
//             duration: Duration(seconds: 2),
//             backgroundColor: Colors.white,
//             leading: (cancel) => SizedBox.fromSize(
//               size: const Size(30, 30),
//               child: ImageIcon(
//                 AssetImage("assets/final_logo_1.png"),
//                 color: primaryLightColor,
//               ),
//             ),
//             title: (_) => Text(notification.title,
//                 style: GoogleFonts.roboto(
//                     fontSize: 16,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold)),
//             subtitle: (_) => Text(
//               notification.body,
//               style: GoogleFonts.roboto(
//                   fontSize: 14,
//                   color: Colors.black,
//                   fontWeight: FontWeight.normal),
//             ),
//           );
//         }
//       },
//     );
//   }

//   Future<String> getDeviceToken() async {
//     String fcmToken = await _fcm.getToken();
//     // Save it to Firestore
//     if (fcmToken != null) {
//       logger.d("This is FCM token : $fcmToken");
//       return fcmToken;
//     } else {
//       throw ErrorDescription("FCM token null");
//     }
//   }

//   Future pushFcmToken(FcmTokenRequest fcmTokenRequest) async {
//     var response = await _api.pushFcmToken(fcmTokenRequest);
//   }
// }
