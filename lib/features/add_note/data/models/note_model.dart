


import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  bool isFavorite;
  @HiveField(3)
  bool isHidden;
  @HiveField(4)
  final String date;

  NoteModel({required this.title, required this.description, required this.isFavorite, required this.isHidden, required this.date});
}