import 'package:flutter/material.dart';
import 'package:my_notes_app/core/theme/app_colors.dart';
import 'package:my_notes_app/features/home/ui/widgets/other_notes_list_view.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/constatnt.dart';
import '../../../core/utils/spacing.dart';

class OtherNotesScreen extends StatefulWidget {
  const OtherNotesScreen({super.key});

  @override
  State<OtherNotesScreen> createState() => _OtherNotesScreenState();
}

class _OtherNotesScreenState extends State<OtherNotesScreen> {
  late String screenTitle;
  @override
  void initState() {
    screenTitle = isHidden == true ? "Hidden Notes" : "Favourite Notes";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F6),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 70.0, left: 25, right: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackButton(),
                  Text(
                    screenTitle,
                    style: AppTextStyle.font22BlackWeight600,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.0),
                child: Divider(
                  height: 15,
                ),
              ),
              verticalSpace(15),
              OtherNotesListView(),
            ],
          ),
        ));
  }
}
