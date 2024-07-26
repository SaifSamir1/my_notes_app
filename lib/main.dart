import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_notes_app/core/routing/app_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/database/cache/hive_helper.dart';
import 'core/utils/bloc_observer.dart';
import 'notes_app.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  await Hive.openBox('MyNotes');
  await Hive.openBox(HiveHelpers.notesBox);
  FlutterNativeSplash.remove();
  runApp(
    NotesApp(
      appRouter: AppRouter(),
    ),
  );
}
