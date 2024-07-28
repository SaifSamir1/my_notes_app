import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_notes_app/core/utils/extensions.dart';
import 'package:my_notes_app/features/home/logic/notes_cubit.dart';
import 'package:my_notes_app/features/home/logic/notes_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/no_notes_yet.dart';
import '../../../add_note/data/models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
  });

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  Future<void> _refreshNotes(BuildContext context) async {
    await context.read<NotesCubit>().fetchAllNotes();
    context.read<NotesCubit>().filterCurrentNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).currentNotes ?? [];
        notes = notes.reversed.toList();
        return RefreshIndicator(
            color: AppColors.blue,
            onRefresh: () => _refreshNotes(context),
            child: notes.isEmpty
                ? const SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: NoNotesYet())
                : SlidableAutoCloseBehavior(
                    closeWhenOpened: true,
                    child: RefreshIndicator(
                      color: AppColors.blue,
                      onRefresh: () => _refreshNotes(context),
                      child: ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return _buildSlidableWidget(notes, index);
                        },
                        separatorBuilder: (context, index) => verticalSpace(8),
                        itemCount: notes.length,
                      ),
                    ),
                  ));
      },
    );
  }

  Slidable _buildSlidableWidget(List<NoteModel> notes, int index) {
    return Slidable(
      key: ValueKey(notes[index]),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () {
            context.read<NotesCubit>().deleteNotes(notes[index], index);
            log("deleted is done ");
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
            onPressed: (BuildContext context) {},
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          context.pushNamed(Routes.editNote,arguments: notes[index]);
        },
        child: NoteItem(
          note: notes[index],
        ),
      ),
    );
  }
}
