
import 'package:hive/hive.dart';
import '../../../features/add_note/data/models/note_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelpers {
  static const String notesBox = 'MyNotes';
  static var box = Hive.box<NoteModel>(notesBox);
  static const String getStarted = 'getStarted';

  static List<NoteModel> noteList = [];

  // Add a note
  static Future<void> addNote(NoteModel note) async{
    await box.add(note);
    noteList.add(note);
  }

  static Box? myBox;


  static Future<Box> openHiveBox(String boxName) async
  {
//كدا انا بقوله لو هو مفتوح خد ال path وروح اعمله init
    if(!Hive.isBoxOpen(boxName))
    {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    //لو لا يبقي روح افتحه
    return await Hive.openBox(boxName);

  }

}