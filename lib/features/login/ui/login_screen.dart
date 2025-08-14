import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/helpers/spacing.dart';

import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/core/widgets/app_text_button.dart';

import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_cubit.dart';

import 'package:doctor_appointment/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:doctor_appointment/features/login/ui/widgets/email_and_password.dart';
import 'package:doctor_appointment/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doctor_appointment/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey formkey = GlobalKey<FormState>();

  //bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: TextStyles.font24BlueBold),
                verticalSpacing(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GreyRegular,
                ),
                verticalSpacing(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalSpacing(12),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),
                    verticalSpacing(16),
                    //
                    TermsAndConditionsText(),
                    verticalSpacing(32),
                    DontHaveAccountText(),
                    const LoginBlocListener(),
                    //
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
