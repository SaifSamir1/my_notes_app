import 'package:flutter/material.dart';
import 'package:my_notes_app/features/on_boarding/ui/widgets/onboarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingScreenBody(),
    );
  }
}
