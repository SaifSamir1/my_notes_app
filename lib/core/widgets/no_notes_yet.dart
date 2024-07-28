import 'package:flutter/material.dart';
import 'package:my_notes_app/core/utils/spacing.dart';

import '../theme/app_text_styles.dart';

class NoNotesYet extends StatelessWidget {
  const NoNotesYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.asset(
            "assets/images/no_notes.jpg",
            fit: BoxFit.cover,
            height: 350,
            width: 340,
          ),
        ),
        verticalSpace(15),
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Text(
            textAlign: TextAlign.center,
            "No notes available yet , add new notes by clicking on ' + ' button",
            style: AppTextStyle.font20BlackWeight400,
          ),
        ),
      ],
    );
  }
}
