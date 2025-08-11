import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/core/widgets/app_text_button.dart';

import 'package:doctor_appointment/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doctor_appointment/features/signup/logic/cubit/signup_cubit.dart';
import 'package:doctor_appointment/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:doctor_appointment/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:doctor_appointment/features/signup/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                    const SignupForm(),
                    // verticalSpacing(12),
                    // Align(
                    //   alignment: AlignmentDirectional.centerEnd,
                    //   child: Text(
                    //     'Forgot Password',
                    //     style: TextStyles.font13BlueRegular,
                    //   ),
                    // ),
                    verticalSpacing(40),
                    AppTextButton(
                      buttonText: 'Sign up',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenSignup(context);
                      },
                    ),
                    verticalSpacing(16),
                    //
                    TermsAndConditionsText(),
                    verticalSpacing(32),
                    AlreadyHaveAccountText(),
                    SignupBlocListener(),
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

  void validateThenSignup(BuildContext context) {
    if (context.read<SignupCubit>().formkey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
