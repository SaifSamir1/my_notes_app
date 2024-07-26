
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10,left: 18,right: 18),
      width: double.infinity,
      height: 120,
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
          Row(
            children: [
              Text("Title",style: AppTextStyle.font16BlackBold,),
              const Spacer(),
              InkWell(
                onTap: (){

                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(14),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.blue,
                    child: Icon(
                      size: 16,
                      Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              horizontalSpace(12),
              InkWell(
                onTap: (){

                },
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(14),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 14,
                    child: Icon(
                      size: 20,
                      Icons.star_border_purple500_outlined,
                      color: AppColors.yallow,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 15,
          ),
          Text("Description",style: AppTextStyle.font12Regular),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(DateTime.now().toIso8601String().split('T').first,style: AppTextStyle.font12Regular)
            ],
          )
        ],
      ),
    );
  }
}
