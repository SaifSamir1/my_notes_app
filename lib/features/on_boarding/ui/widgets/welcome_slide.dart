import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: AssetImage(
            path,
          ),
          width: double.infinity,
        ),
      ),
    );
  }
}
