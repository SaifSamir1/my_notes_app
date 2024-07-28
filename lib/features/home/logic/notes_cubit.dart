

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/core/database/cache/hive_helper.dart';

import '../../add_note/data/models/note_model.dart';
import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(ReadNotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? currentNotes;
  List<NoteModel>? favoriteNotes;
  List<NoteModel>? hiddenNotes;

  Color starIconColor = Colors.yellow;
  Color starBackgroundColor = Colors.transparent;

  fetchAllNotes() {
    notes = HiveHelpers.box.values.toList();
    log("all notes ${notes!.length.toString()}");
    filterCurrentNotes();
    emit(ReadNotesSuccess());
  }
  filterCurrentNotes()  {
    if (notes != null) {
      currentNotes = notes!.where((note) => !note.isHidden).toList();
    } else {
      currentNotes = [];
    }
  }

  deleteNotes(NoteModel note,index) {
    note.delete();
    notes!.removeAt(index);
    currentNotes!.removeAt(index);
    fetchAllNotes();
  }
  void removeFromFavorite(NoteModel note, int index) {
    note.isFavorite = false;
    note.save();
    favoriteNotes?.removeAt(index);
    fetchAllNotes();
  }

  void removeFromHidden(NoteModel note, int index) {
    note.isHidden = false;
    note.save();
    hiddenNotes?.removeAt(index);
    fetchAllNotes();
  }
  void clearAllNotes() async {
    await HiveHelpers.box.clear();
    notes!.clear();
    currentNotes!.clear();
    emit(DeleteAllNoteSuccess());
  }
  List<NoteModel>? getFavoriteNotes() {
    favoriteNotes = notes?.where((note) => note.isFavorite).toList();
    return favoriteNotes;
  }
  List<NoteModel>? getHiddenNotes() {
    hiddenNotes = notes?.where((note) => note.isHidden).toList();
    return hiddenNotes;
  }
  void makeNoteFavourite(NoteModel note) {
    note.isFavorite = !note.isFavorite;
    note.save();

    if (note.isFavorite) {
      starIconColor = Colors.yellow;
      starBackgroundColor = Colors.transparent;
      fetchAllNotes();
    } else {
      starIconColor = Colors.white;
      starBackgroundColor = Colors.yellow;
      fetchAllNotes();

    }
  }
  void makeNoteHidden(NoteModel note) {
    note.isHidden = !note.isHidden;
    note.save();
    if (note.isFavorite) {
      fetchAllNotes();
    } else {
      fetchAllNotes();

    }
  }
}
