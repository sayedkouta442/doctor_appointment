import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/core/theming/colors.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/features/login/logic/cubit/login_state.dart';
import 'package:doctor_appointment/features/signup/logic/cubit/signup_cubit.dart';
import 'package:doctor_appointment/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          sigupSuccess: (signupResponse) {
            if (Navigator.canPop(context)) context.pop(); // Close loading
            setupSuccessState(context, signupResponse);
          },
          signupError: (error) {
            if (Navigator.canPop(context)) context.pop(); // Close loading
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  Future<void> setupSuccessState(
    BuildContext context,
    dynamic signupResponse,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 32),
        content: Text(
          'Signup successful!',
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              context.pushNamed(Routes.loginScreen);
            },
            child: Text('OK', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }

  Future<void> setupErrorState(BuildContext context, String error) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
