import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/widgets.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet? ',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(text: 'Sign Up', style: TextStyles.font13BlueRegular),
        ],
      ),
    );
  }
}
