import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 1)
class Note {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String notetext;

  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final String id;
  Note(
      {required this.title,
      required this.notetext,
      required this.date,
      required this.id});

  static List<Note> notes = [
    Note(title: "title", notetext: "note_text", date: DateTime.now(), id: '1'),
    Note(title: "titlea", notetext: "note_text", date: DateTime.now(), id: '2'),
    Note(
        title: "titlevd", notetext: "note_text", date: DateTime.now(), id: '3'),
  ];
}
