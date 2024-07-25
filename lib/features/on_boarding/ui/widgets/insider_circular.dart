

import 'package:flutter/material.dart';

import '../../../../core/utils/animations.dart';
import '../../data/model/functions.dart';
import '../../data/model/page_model.dart';


class InsiderCircular extends StatelessWidget {
  const InsiderCircular({
    super.key,
    required this.currentIndex,
    required this.controller,
  });

  final int currentIndex;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      top: 10,
      child: GestureDetector(
        onTap: () => navigationViaButton(
          currentIndex,
          controller,
          context,
        ),
        child: AnimatedContainer(
          duration: AppAnimationsDuration.defaultDuration,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: PageModel.pagesDetails[currentIndex].color,
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: getProperIcon(currentIndex),
            ),
          ),
        ),
      ),
    );
  }
}
