import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;

  User({required this.name, required this.age});
}
