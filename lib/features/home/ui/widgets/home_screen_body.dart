import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/core/utils/extensions.dart';
import 'package:my_notes_app/features/home/logic/notes_cubit.dart';
import '../../../../core/error/error_dialog.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import 'notes_category.dart';
import 'notes_list_view.dart';

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
          Text(
            "Notes",
            style: AppTextStyle.font26BlackBold,
          ),
          verticalSpace(15),
          const NotesCategory(),
          verticalSpace(20),
          const Divider(),
          Row(
            children: [
              Text(
                "All Notes",
                style: AppTextStyle.font18BlackBold,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  ErrorDialog.showErrorDialog(
                    context,
                    " ",
                    "Are you sure to delete all notes?",
                    () {
                      context.read<NotesCubit>().clearAllNotes();
                      context.pop();
                    },
                  );
                },
                child: Text(
                  "Clear All",
                  style: AppTextStyle.font15Regular,
                ),
              ),
            ],
          ),
          verticalSpace(5),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
