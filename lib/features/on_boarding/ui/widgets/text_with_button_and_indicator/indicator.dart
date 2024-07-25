import 'package:flutter/material.dart';
import '../../../../../core/utils/animations.dart';
import '../../../data/model/page_model.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: AppAnimationsDuration.defaultDuration,
            width: index == currentIndex ? 30 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: PageModel.pagesDetails[currentIndex].color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
