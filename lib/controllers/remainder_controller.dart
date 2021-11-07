import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:maine/models/remainder/remainder_model.dart';

import 'storage_boxes.dart';

class RemainderController extends GetxController {
  final remainderList = <RemainderModel>[].obs;
  final log = Logger();

  addRemainder(RemainderModel remainder) {
    // remainderList.add(remainder);
    update();
    final box = StorageBoxes.getRemainders();
    box.add(remainder);
    log.wtf(remainder.remainderColor.toString());
  }

  editRemainder(RemainderModel remainder) {
    // remainderList.add(remainder);
    remainder.save();
    update();
    Get.back();
    Get.snackbar('Maine', "Remainder updated successfully",
        snackPosition: SnackPosition.BOTTOM, snackStyle: SnackStyle.GROUNDED);
  }

  removeRemainder(RemainderModel remainder) {
    remainder.delete();
    Get.back();
    Get.snackbar('Maine', "Remainder removed successfully");
  }
}
