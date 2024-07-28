import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_notes_app/features/home/logic/notes_state.dart';
import '../../../../core/utils/constatnt.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/no_notes_yet.dart';
import '../../../add_note/data/models/note_model.dart';
import '../../logic/notes_cubit.dart';
import 'note_item.dart';

class OtherNotesListView extends StatefulWidget {
  const OtherNotesListView({super.key});

  @override
  State<OtherNotesListView> createState() => _OtherNotesListViewState();
}

class _OtherNotesListViewState extends State<OtherNotesListView> {
  @override
  Widget build(BuildContext context) {
    List<NoteModel> notes = isHidden == true
        ? BlocProvider.of<NotesCubit>(context).getHiddenNotes() ?? []
        : BlocProvider.of<NotesCubit>(context).getFavoriteNotes() ?? [];

    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return notes.isEmpty
              ? const NoNotesYet()
              : SlidableAutoCloseBehavior(
                  closeWhenOpened: true,
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return _buildSlidableWidget(context, notes, index);
                    },
                    separatorBuilder: (context, index) => verticalSpace(8),
                    itemCount: notes.length,
                  ),
                );
        },
      ),
    );
  }

  Slidable _buildSlidableWidget(
      BuildContext context, List<NoteModel> notes, int index) {
    return Slidable(
      key: ValueKey(notes[index]),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () {
            final noteCubit = context.read<NotesCubit>();
            if (isHidden == true) {
              noteCubit.removeFromHidden(notes[index], index);
              log("deleted is done ");
            } else {
              noteCubit.removeFromFavorite(notes[index], index);
              log("deleted is done ");
            }
          },
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Drag to Delete',
            onPressed: (BuildContext context) {
              final noteCubit = context.read<NotesCubit>();
              if (isHidden == true) {
                noteCubit.removeFromHidden(notes[index], index);
              } else {
                noteCubit.removeFromFavorite(notes[index], index);
              }
            },
          ),
        ],
      ),
      child: NoteItem(
        hideButtons: true,
        note: notes[index],
      ),
    );
  }
}
