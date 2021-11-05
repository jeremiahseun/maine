import 'package:get/get.dart';
import 'package:maine/models/remainder_model.dart';

class RemainderController extends GetxController {
  final remainderList = <String>[].obs;

  addRemainder(String remainder) {
    remainderList.add(remainder);
    update();
  }
}
