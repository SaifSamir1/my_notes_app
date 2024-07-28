
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/database/cache/hive_helper.dart';
import '../../data/models/note_model.dart';
import 'add_and_validate_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController tittle = TextEditingController();
  final TextEditingController describtion = TextEditingController();

  AddNoteCubit() : super(AddNoteInitial());

  Future<void> validateThenAddNote(BuildContext context,NoteModel note) async{
    emit(AddNoteLoadingState());
    if (formKey.currentState?.validate() == true) {
      await HiveHelpers.addNote(note).then((v){
        tittle.clear();
        describtion.clear();
        log("done");
        emit(AddNoteValidated());
      }).catchError((e){
        log(e.toString());
      });
    } else {
      log("Form is invalid");
      emit(AddNoteInvalid());
    }
  }

  @override
  Future<void> close() {
    tittle.dispose();
    describtion.dispose();
    return super.close();
  }
}