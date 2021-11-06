import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:maine/controllers/remainder_controller.dart';
import 'package:maine/utils/constants.dart';

final RemainderController remainderController = Get.put(RemainderController());

Future createImportantNotification(String title, String description) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: remainderController.remainderList.length,
        channelKey: MaineConstants.importantNotification,
        autoDismissable: false,
        bigPicture: 'asset://assets/logo.png',
        notificationLayout: NotificationLayout.BigPicture,
        title: title,
        groupKey: 'group-notifs',
        displayOnBackground: true,
        body: description,
      ),
      actionButtons: [NotificationActionButton(key: 'key', label: 'Okay')]);
}

Future createScheduleNotification(String title, String description) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: remainderController.remainderList.length,
        channelKey: MaineConstants.importantNotification,
        autoDismissable: false,
        bigPicture: 'asset://assets/logo.png',
        notificationLayout: NotificationLayout.BigPicture,
        displayOnBackground: true,
        title: title,
        body: description,
      ),
      actionButtons: [NotificationActionButton(key: 'key', label: 'Come on in!')]);
}
