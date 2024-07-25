import 'package:flutter/material.dart';
import '../../../../../core/utils/animations.dart';
import '../../../data/model/page_model.dart';

class OuterCircular extends StatelessWidget {
  const OuterCircular({
    super.key,
    required this.currentIndex
  });

  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 70,
      child: TweenAnimationBuilder<double>(
        tween: PageModel.pagesDetails[currentIndex].progress,
        duration: AppAnimationsDuration.circularProgressIndicator,
        builder: (_, value, __) => CircularProgressIndicator(
          backgroundColor: Colors.grey.withOpacity(0.2),
          value: value,
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(
            PageModel.pagesDetails[currentIndex].color,
          ),
        ),
      ),
    );
  }
}
