import 'package:get/get.dart';
import 'package:maine/models/remainder_model.dart';

class RemainderController extends GetxController {
  final remainderList = <RemainderModel>[].obs;

  addRemainder(RemainderModel remainder) {
    remainderList.add(remainder);
    update();
  }
}
