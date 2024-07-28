

abstract class NotesState{}

class ReadNotesInitial extends NotesState{}

class ReadNotesSuccess extends NotesState{}

class DeleteNoteSuccess extends NotesState{}


class DeleteAllNoteSuccess extends NotesState{}
class NoteDeletedFromFav extends NotesState{}
class NoteDeletedFromHidden extends NotesState{}


class NoteBeFavSuccess1 extends NotesState{}
class NoteBeFavSuccess2 extends NotesState{}

class NoteBeHiddenSuccess1 extends NotesState{}
class NoteBeHiddenSuccess2 extends NotesState{}
