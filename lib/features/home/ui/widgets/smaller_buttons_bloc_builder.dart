import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../add_note/data/models/note_model.dart';
import '../../logic/notes_cubit.dart';
import '../../logic/notes_state.dart';

class SmallButtonsBlocBuilder extends StatelessWidget {
  const SmallButtonsBlocBuilder({
    super.key,
    required this.note,
    required this.hideButtons,
  });

  final NoteModel note;
  final bool? hideButtons;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        context.read<NotesCubit>().filterCurrentNotes();
        return Row(
          children: [
            Text(
              note.title,
              style: AppTextStyle.font16BlackBold,
            ),
            const Spacer(),
            if (hideButtons == false)
              InkWell(
                onTap: () {
                  context.read<NotesCubit>().makeNoteHidden(note);
                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(14),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.blue,
                    child: Icon(
                      size: 16,
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            horizontalSpace(12),
            if (hideButtons == false)
              InkWell(
                onTap: () {
                  context.read<NotesCubit>().makeNoteFavourite(note);
                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(14),
                  child: CircleAvatar(
                    backgroundColor: note.isFavorite
                        ? Colors.yellow
                        : Colors.transparent,
                    radius: 14,
                    child: Icon(
                      size: 20,
                      Icons.star_border_purple500_outlined,
                      color:note.isFavorite ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
