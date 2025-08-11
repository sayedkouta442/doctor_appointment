import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/widgets.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.signupScreen);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account yet? ",
              style: TextStyles.font13DarkBlueRegular,
            ),
            TextSpan(text: 'Sign Up', style: TextStyles.font13BlueRegular),
          ],
        ),
      ),
    );
  }
}
