import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/core/helpers/constants.dart';
import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/helpers/shared_pref_helper.dart';
import 'package:doctor_appointment/core/routing/app_router.dart';
import 'package:doctor_appointment/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to fix .sp font bug in flutter_screenutil in realse mode.
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  userToken.isNullOrEmpty() ? isLoggedInUser == false : isLoggedInUser = true;
}
