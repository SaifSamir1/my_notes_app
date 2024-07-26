
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:my_notes_app/features/home/data/models/note_model.dart';

class HiveHelpers {
  static const String notesBox = 'MyNotes';
  static const String notesBoxKey = 'notesBoxKey';
  static var box = Hive.box(notesBox);

  static List<NoteModel> noteList = [];

  // Add a note
  static void addNote(NoteModel note) {
    noteList.add(note);
    box.put(notesBoxKey, noteList);
    log(box.get(notesBoxKey));
  }

  // Get all notes
  static Future<void> getAllNotes() async {
    if (box.get(notesBoxKey) != null) {
      noteList = await box.get(notesBoxKey);
    }
  }

  // Remove a note
  static void removeNote(int index) {
    noteList.removeAt(index);
    box.put(notesBoxKey, noteList);
  }

  // Clear all notes
  static void clearAll() {
    noteList.clear();
    box.put(notesBoxKey, noteList);
  }

  // Update a note
  static void updateNote(int index, NoteModel note) {
    noteList[index] = note;
    box.put(notesBoxKey, noteList);
  }
}