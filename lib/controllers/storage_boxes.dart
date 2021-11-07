import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:maine/models/remainder/remainder_model.dart';
import 'package:maine/utils/constants.dart';

class StorageBoxes extends GetxService{
  static Box<RemainderModel> getRemainders() =>
  Hive.box<RemainderModel>(MaineConstants.remainderBox);
}