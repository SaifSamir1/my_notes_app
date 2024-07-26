import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/core/routing/routes.dart';
import 'package:my_notes_app/features/add_note_and_edit_it/ui/screens/add_note_screen.dart';
import 'package:my_notes_app/features/home/logic/home_cubit.dart';
import 'package:my_notes_app/features/home/ui/home_screen.dart';

import '../../features/on_boarding/ui/on_boarding_view.dart';


class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => HomeCubit(),
              child: const HomeScreen()),
        );
      case Routes.addNotes:
        return MaterialPageRoute(
          builder: (_) => const AddNoteScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const AddNoteScreen(),
        );
    }
  }
}
