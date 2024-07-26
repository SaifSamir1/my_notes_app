import 'package:flutter/material.dart';
import 'package:my_notes_app/core/theme/app_colors.dart';
import 'package:my_notes_app/core/theme/app_text_styles.dart';
import 'package:my_notes_app/features/home/ui/widgets/note_item.dart';
import 'package:my_notes_app/features/home/ui/widgets/notes_category.dart';

import '../../../core/utils/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {},
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

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 70.0, left: 25, right: 25, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Notes",
                style: AppTextStyle.font26BlackBold,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.dark_mode),
                onPressed: () {},
              )
            ],
          ),
          verticalSpace(15),
          const NotesCategory(),
          verticalSpace(20),
          Row(
            children: [
              Text(
                "All Notes",
                style: AppTextStyle.font18BlackBold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Clear All",
                  style: AppTextStyle.font15Regular,
                ),
              ),
            ],
          ),
          verticalSpace(5),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => const NoteItem(),
              separatorBuilder: (context, index) => verticalSpace(8),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
