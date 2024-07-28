import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_notes_app/features/home/ui/widgets/smaller_buttons_bloc_builder.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../add_note/data/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
    this.hideButtons = false,
  });

  final NoteModel note;
  final bool? hideButtons;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
      width: double.infinity,
      height: 150,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 1,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallButtonsBlocBuilder(
            note: note,
            hideButtons: hideButtons,
          ),
          const Divider(
            height: 20,
            color: AppColors.blue,
          ),
          SizedBox(
              height: 50,
              child: Text(note.description, style: AppTextStyle.font12Regular)),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(note.date, style: AppTextStyle.font12Regular)],
          )
        ],
      ),
    );
  }
}
