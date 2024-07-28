import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_notes_app/core/routing/app_router.dart';

import 'features/home/logic/notes_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Set your desired color here
        ),
        child: BlocProvider<NotesCubit>(
          create: (context) => NotesCubit()..fetchAllNotes(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute,
          ),
        ),
      ),
    );
  }
}
