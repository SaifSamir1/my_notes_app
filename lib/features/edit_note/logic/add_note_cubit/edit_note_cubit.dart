import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../add_note/data/models/note_model.dart';
import 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newTittle = TextEditingController();
  final TextEditingController newDescribtion = TextEditingController();

  EditNoteCubit() : super(EditNoteInitial());

  Future<void> editNote(NoteModel note) async {
    emit(EditNoteLoadingState());
    log("no text");
    note.title = newTittle.text.isEmpty ?  note.title : newTittle.text;
    note.description = newDescribtion.text.isEmpty ? note.description : newDescribtion.text;
    note.isFavorite = note.isFavorite;
    note.isHidden = note.isHidden;
    await note.save();
    emit(EditNoteSuccessfully());
  }

  @override
  Future<void> close() {
    newTittle.dispose();
    newDescribtion.dispose();
    return super.close();
  }
}
