import 'package:bloc/bloc.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/signup/data/models/sign_up_request_body.dart';
import 'package:doctor_appointment/features/signup/data/repos/signup_repo.dart';
import 'package:doctor_appointment/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(SignupState.initial());
  final SignupRepo _signupRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void emitSignupStates() async {
    emit(SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );

    response.whenOrNull(
      success: (signupRequestBody) {
        emit(SignupState.sigupSuccess(signupRequestBody));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
