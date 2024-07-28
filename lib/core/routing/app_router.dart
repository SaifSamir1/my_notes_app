import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/core/routing/routes.dart';
import 'package:my_notes_app/features/add_note/data/models/note_model.dart';
import 'package:my_notes_app/features/edit_note/logic/add_note_cubit/edit_note_cubit.dart';
import 'package:my_notes_app/features/edit_note/ui/screens/edit_note_screen.dart';
import 'package:my_notes_app/features/home/logic/notes_cubit.dart';
import 'package:my_notes_app/features/home/ui/home_screen.dart';
import 'package:my_notes_app/features/home/ui/other_notes_screen.dart';
import '../../features/add_note/logic/add_note_cubit/add_and_validate_note_cubit.dart';
import '../../features/add_note/ui/screens/add_note_screen.dart';
import '../../features/on_boarding/ui/on_boarding_view.dart';
import '../database/cache/hive_helper.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.addNotes:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AddNoteCubit>(
              create: (context) => AddNoteCubit(),
              child: const AddNoteScreen()),
        );
      case Routes.editNote:
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EditNoteCubit>(
              create: (context) => EditNoteCubit(),
              child: EditNoteScreen(note: note)),
        );
      case Routes.otherNotes:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NotesCubit>(
              create: (context) => NotesCubit()..fetchAllNotes(),
              child: const OtherNotesScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => HiveHelpers.myBox!.get("login") == true
              ? const HomeScreen()
              : const OnBoardingScreen(),
        );
    }
  }
}
