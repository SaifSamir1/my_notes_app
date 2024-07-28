import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/features/add_note/ui/widgets/save_button.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../logic/add_note_cubit/add_and_validate_note_cubit.dart';
import '../../logic/add_note_cubit/add_and_validate_note_state.dart';

class AddNoteScreenBody extends StatelessWidget {
  const AddNoteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            final formCubit = context.read<AddNoteCubit>();
            return Form(
              key: formCubit.formKey,
              autovalidateMode: state.autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: AppTextStyle.font22BlackWeight600,
                  ),
                  verticalSpace(10),
                  CustomTextFormField(
                    controller: formCubit.tittle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the title';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(15),
                  Text(
                    "Description",
                    style: AppTextStyle.font22BlackWeight600,
                  ),
                  verticalSpace(10),
                  CustomTextFormField(
                    controller: formCubit.describtion,
                    maxLength: 10,
                    containerHeight: 270,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Description is required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpace(20),
                  const SaveButton()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
