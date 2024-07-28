import 'package:flutter/material.dart';

abstract class AddNoteState {
  final AutovalidateMode autovalidateMode;

  AddNoteState(this.autovalidateMode);
}

class AddNoteInitial extends AddNoteState {
  AddNoteInitial() : super(AutovalidateMode.disabled);
}

class AddNoteValidated extends AddNoteState {
  AddNoteValidated() : super(AutovalidateMode.disabled);
}

class AddNoteInvalid extends AddNoteState {
  AddNoteInvalid() : super(AutovalidateMode.always);
}

class AddNoteLoadingState extends AddNoteState {
  AddNoteLoadingState() : super(AutovalidateMode.disabled);
}