import 'package:flutter/material.dart';
import 'package:my_notes_app/core/theme/app_colors.dart';
import 'package:my_notes_app/core/utils/extensions.dart';
import 'package:my_notes_app/features/home/ui/widgets/home_screen_body.dart';
import '../../../core/routing/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            context.pushNamed(Routes.addNotes);
          },
          backgroundColor: AppColors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color(0xffF2F2F6),
      body: const HomeScreenBody(),
    );
  }
}
