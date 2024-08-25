import 'package:hive/hive.dart';

class HiveMethods {
  final Box<String> notesBox = Hive.box<String>('notesBox');

  createNote(String note) {
    notesBox.add(note);
  }

  List<String> getNotes() {
    return notesBox.values.toList();
  }

  updateNote(int index, String updateNote) {
    notesBox.putAt(index, updateNote);
  }

  deleteNote(int index) {
    notesBox.deleteAt(index);
  }
}
