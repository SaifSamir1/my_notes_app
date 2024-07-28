import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_notes_app/core/routing/routes.dart';
import 'package:my_notes_app/core/utils/extensions.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/constatnt.dart';
import '../../../../core/utils/spacing.dart';

class NotesCategory extends StatelessWidget {
  const NotesCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          _buildCategoryItem(
            onTap: (){
              isHidden = true;
              context.pushNamed(Routes.otherNotes);
            },
              title: "Hidden",
              icon: Icons.visibility_off_outlined,
              backgroundIconColor: AppColors.blue),
          horizontalSpace(15),
          _buildCategoryItem(
            onTap: (){
              isHidden = false;
              context.pushNamed(Routes.otherNotes);
            },
            title: "Favourites",
            icon: Icons.star_border_purple500_outlined,
            backgroundIconColor: AppColors.yallow,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required String title,
    required IconData icon,
    required Color backgroundIconColor,
    required void Function()? onTap
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        width: 160.w,
        height: 50.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: backgroundIconColor,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            horizontalSpace(15),
            Text(
              title,
              style: AppTextStyle.font15Regular,
            )
          ],
        ),
      ),
    );
  }
}
