

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/flutter_toust.dart';
import '../../data/models/note_model.dart';
import '../../logic/add_note_cubit/add_and_validate_note_cubit.dart';
import '../../logic/add_note_cubit/add_and_validate_note_state.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNoteCubit,AddNoteState>(
      listener: (context,state) {
        if (state is AddNoteValidated)
          {
            showFlutterToastSuccess("The Note has been added successfully");
          }
        if(state is AddNoteInvalid){
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
              onPressed: () {
                NoteModel note = NoteModel(
                    title: context.read<AddNoteCubit>().tittle.text,
                    description: context.read<AddNoteCubit>().describtion.text,
                    isFavorite: false,
                    isHidden: false,
                    date: DateTime.now().toIso8601String().split('T').first);
                context.read<AddNoteCubit>().validateThenAddNote(context,note);
              },
              child: const Text("Save"), // Text for the button
            ),
          )
        ],
      ),
    );
  }
}
