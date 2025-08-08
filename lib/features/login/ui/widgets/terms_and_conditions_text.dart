import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/widgets.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,

      text: TextSpan(
        children: [
          TextSpan(
            text: 'By Loggoing, you agree to our ',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: 'and ',
            style: TextStyles.font13GreyRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: 'PrivacyPolicy',
            style: TextStyles.font13DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
