import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/features/edit_note/ui/widgets/confirm_the_edit_button.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../add_note/data/models/note_model.dart';
import '../../logic/add_note_cubit/edit_note_cubit.dart';

class EditNoteScreenBody extends StatelessWidget {
  const EditNoteScreenBody({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final formCubit = context.read<EditNoteCubit>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Title",
              style: AppTextStyle.font22BlackWeight600,
            ),
            verticalSpace(10),
            CustomTextFormField(
              hintText: note.title,
              controller: formCubit.newTittle,
              validator: (value) {
                return null;
              },
            ),
            verticalSpace(15),
            Text(
              "New Description",
              style: AppTextStyle.font22BlackWeight600,
            ),
            verticalSpace(10),
            CustomTextFormField(
              hintText: note.description,
              controller: formCubit.newDescribtion,
              maxLength: 10,
              containerHeight: 270,
              validator: (value) {
                return null;
              },
            ),
            verticalSpace(20),
            ConfirmTheEditButton(
              note: note,
            )
          ],
        ),
      ),
    );
  }
}
