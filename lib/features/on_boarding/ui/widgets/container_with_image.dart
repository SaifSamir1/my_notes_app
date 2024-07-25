import 'package:flutter/material.dart';
import 'package:my_notes_app/core/utils/images.dart';
import 'package:my_notes_app/features/on_boarding/ui/widgets/welcome_slide.dart';


class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({
    required this.controller,
    super.key,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        OnBoardingImage(
            path: AssetsImages.onBoarding1,
        ),
        OnBoardingImage(
          path:  AssetsImages.onBoarding2,
        ),
        OnBoardingImage(
          path: AssetsImages.onBoarding3,
        ),
      ],
    );
  }
}
