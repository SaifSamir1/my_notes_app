part of 'text_with_button_and_indicator.dart';

class MainText extends StatelessWidget {
  const MainText({super.key,
     required this.currentTitle, required this.currentSubTitle,
  });

  final String currentTitle;
  final String currentSubTitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentTitle,
            style: AppTextStyle.font32BlackWeight700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Text(
              currentSubTitle,
              style: AppTextStyle.font15Regular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
