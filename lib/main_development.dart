import 'package:doctor_appointment/core/di/dependency_injection.dart';
import 'package:doctor_appointment/core/routing/app_router.dart';
import 'package:doctor_appointment/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // to fix .sp font bug in flutter_screenutil in realse mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
