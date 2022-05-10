import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
part 'studentlist_model.g.dart';

@HiveType(typeId: 0)
class Studentlist extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String domain;
  @HiveField(2)
  String number;
  @HiveField(3)
  String place;
  @HiveField(4)
  String? image;
  Studentlist(
      {required this.name,
      required this.domain,
      required this.number,
      required this.place,required this.image});
}
