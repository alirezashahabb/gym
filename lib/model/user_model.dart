import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? fullName;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? registerData;
  @HiveField(4)
  String? endDate;
  @HiveField(5)
  int? registerType;

  User(
    this.fullName,
    this.phone,
    this.price,
    this.registerData,
    this.endDate,
    this.registerType,
  );
}
