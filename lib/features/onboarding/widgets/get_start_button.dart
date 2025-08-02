import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/core/theming/colors.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyles.font16WhiteBold),
        backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBlue),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 54)),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text('Get Start'),
    );
  }
}
