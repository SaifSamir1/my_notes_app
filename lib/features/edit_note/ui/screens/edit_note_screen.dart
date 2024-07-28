
import 'package:flutter/material.dart';
import 'package:my_notes_app/core/routing/routes.dart';
import 'package:my_notes_app/core/theme/app_colors.dart';
import 'package:my_notes_app/core/theme/app_text_styles.dart';
import 'package:my_notes_app/core/utils/extensions.dart';
import '../../../add_note/data/models/note_model.dart';
import '../widgets/edit_note_screen_body.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note, });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.blue,
          onPressed: () {
            context.pushReplacementNamed(Routes.homePage);
          },
        ),
        title: Text(
          "Edit Note",
          style: AppTextStyle.font18BlackBold,
        ),
      ),
      backgroundColor: const Color(0xffF2F2F6),
      body: EditNoteScreenBody(
        note: note,
      ),
    );
  }
}

