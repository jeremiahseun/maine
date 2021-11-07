import 'package:hive/hive.dart';

part 'remainder_model.g.dart';

@HiveType(typeId: 0)
class RemainderModel extends HiveObject{
  @HiveField(0)
  final String? remainderTitle;
  @HiveField(1)
  final String? remainderDescription;
  @HiveField(2)
  final int? remainderColor;

  RemainderModel({this.remainderTitle, this.remainderDescription, this.remainderColor});
}
