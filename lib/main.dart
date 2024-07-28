import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_notes_app/core/routing/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/database/cache/hive_helper.dart';
import 'core/utils/bloc_observer.dart';
import 'features/add_note/data/models/note_model.dart';
import 'notes_app.dart';


void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  // the ordering of the 3 lines of the hive code bellow is important
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(HiveHelpers.notesBox);
  HiveHelpers.myBox = await HiveHelpers.openHiveBox(HiveHelpers.getStarted);
  await getStarted();
  FlutterNativeSplash.remove();
  runApp(
    NotesApp(
      appRouter: AppRouter(),
    ),
  );
}

Future<void> getStarted() async{
  if(HiveHelpers.myBox!.get("login") == true)
    {
      await HiveHelpers.myBox!.put("login", true);
    }else{
    await HiveHelpers.myBox!.put("login", false);
  }
}