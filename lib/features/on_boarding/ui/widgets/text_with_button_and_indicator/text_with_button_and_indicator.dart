import 'package:flutter/material.dart';
import 'package:my_notes_app/core/theme/app_text_styles.dart';
import '../bottom_widgets.dart';
import '../text_with_animation.dart';
part 'main_text.dart';


class TextWithButtonAndIndicator extends StatelessWidget {
  const TextWithButtonAndIndicator({
    required this.currentIndex,
    required this.controller,
    super.key,
  });

  final int currentIndex;
  final PageController controller;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextWithAnimation(
              currentIndex: currentIndex,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ).copyWith(
              bottom: 24,
            ),
            child: BottomWidgets(
              controller: controller,
              currentIndex: currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}

