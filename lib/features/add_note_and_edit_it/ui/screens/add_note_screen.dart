

import 'package:flutter/material.dart';
import 'package:my_notes_app/core/theme/app_text_styles.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Add Note",style: AppTextStyle.font18BlackBold,),
      ),
      backgroundColor: Color(0xffF2F2F6),
      body: AddNoteScreenBody(),
    );
  }
}

class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}
