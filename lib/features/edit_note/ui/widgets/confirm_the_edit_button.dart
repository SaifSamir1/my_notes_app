

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/flutter_toust.dart';
import '../../../add_note/data/models/note_model.dart';
import '../../logic/add_note_cubit/edit_note_cubit.dart';
import '../../logic/add_note_cubit/edit_note_state.dart';

class ConfirmTheEditButton extends StatelessWidget {
  const ConfirmTheEditButton({
    super.key, required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditNoteCubit,EditNoteState>(
      listener: (context,state) {
        if (state is EditNoteSuccessfully)
          {
            showFlutterToastSuccess("The Note has been Edited successfully");
          }
        if(state is EditNoteError){
            showFlutterToastError("Something is wrong , please try again");

        }
        },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                color: AppColors.blue, borderRadius: BorderRadius.circular(15)),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(
                    Colors.white),
                backgroundColor: WidgetStateProperty.all(
                    AppColors.blue),
              ),
              onPressed: () async {
                // NoteModel note = NoteModel(
                //     title: context.read<EditNoteCubit>().newTittle.text,
                //     description: context.read<EditNoteCubit>().newDescribtion.text,
                //     isFavorite: false,
                //     isHidden: false,
                //     date: DateTime.now().toIso8601String().split('T').first);\
                await context.read<EditNoteCubit>().editNote(note);
              },
              child: const Text("Confirm"), // Text for the button
            ),
          )
        ],
      ),
    );
  }
}
