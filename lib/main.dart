import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maine/models/remainder/remainder_model.dart';
import 'package:maine/shared/colors.dart';
import 'package:maine/utils/constants.dart';
import 'package:maine/views/onboarding/onboarding.dart';
import 'package:hive/hive.dart';

initializeNotification() {
  AwesomeNotifications().initialize(
      'resource://drawable/res_logo',
      [
        NotificationChannel(
            channelKey: MaineConstants.scheduleNotification,
            channelName: "Scheduled Notification",
            channelDescription: 'Notification channel for schedule remainders',
            defaultColor: MaineColors.deepPurple,
            locked: true,
            channelShowBadge: true,
            enableLights: true,
            enableVibration: true,
            defaultRingtoneType: DefaultRingtoneType.Ringtone,
            importance: NotificationImportance.High,
            playSound: true,
            ledColor: Colors.red),
        NotificationChannel(
            channelDescription: 'Notification channel for important tests',
            channelKey: MaineConstants.importantNotification,
            channelName: 'Important notifications',
            defaultColor: MaineColors.deepPurple,
            playSound: true,
            groupSort: GroupSort.Asc,
            groupKey: 'group-notifs',
            enableVibration: true,
            importance: NotificationImportance.High,
            channelShowBadge: true)
      ],
      debug: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeNotification();
  await Hive.initFlutter();
  Hive.registerAdapter(RemainderModelAdapter());
  await Hive.openBox<RemainderModel>(MaineConstants.remainderBox);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if (!value) {
        AwesomeNotifications().requestPermissionToSendNotifications();
        print("The result of accepting Notifications is $value");
      }
    });
    AwesomeNotifications().actionStream.listen((action) {
      print("The action is $action");
      Get.to(() => Onboarding(), arguments: action.id);
    });
    return GetMaterialApp(
      title: 'Maine',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        primaryColor: MaineColors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Onboarding(),
    );
  }
}
