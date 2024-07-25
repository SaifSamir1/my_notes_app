import 'package:flutter/material.dart';
import 'package:my_notes_app/core/routing/routes.dart';
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
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
    }
  }
}
