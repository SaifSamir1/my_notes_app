import 'package:flutter/material.dart';
import 'package:my_notes_app/core/database/cache/hive_helper.dart';
import 'package:my_notes_app/core/utils/extensions.dart';

import '../../../../core/routing/routes.dart';


Icon getProperIcon(int currentIndex) => currentIndex != 2
    ? const Icon(
        Icons.navigate_next,
        key: ValueKey('next_icon'),
        color: Colors.white,
        size: 10,
      )
    : const Icon(
        Icons.done,
        key: ValueKey('done_icon'),
        color: Colors.white,
        size: 10,
      );

void navigationViaButton(
    int currentIndex,
    PageController controller,
    BuildContext context
)async {
  if (currentIndex != 2)
    {
      controller.nextPage(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutCirc,
      );
    } else  {
    HiveHelpers.myBox!.put("login", true);
    context.pushReplacementNamed(Routes.homePage);
  }
}
