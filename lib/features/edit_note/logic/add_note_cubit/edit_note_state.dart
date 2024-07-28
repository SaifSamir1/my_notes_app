import 'package:flutter/material.dart';

abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {
}

class EditNoteSuccessfully extends EditNoteState {}

class EditNoteError extends EditNoteState {
}

class EditNoteLoadingState extends EditNoteState {}