import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/core/networking/api_service.dart';
import 'package:doctor_appointment/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}




// import 'package:flutter/material.dart';

// class FontWeightHelper {
//   static const FontWeight thin = FontWeight.w100;
//   static const FontWeight extraLight = FontWeight.w200;
//   static const FontWeight light = FontWeight.w300;
//   static const FontWeight regular = FontWeight.w400;
//   static const FontWeight medium = FontWeight.w500;
//   static const FontWeight semiBold = FontWeight.w600;
//   static const FontWeight bold = FontWeight.w700;
//   static const FontWeight extraBold = FontWeight.w800;
// }



// import 'package:doctor_appointment/core/theming/colors.dart';
// import 'package:doctor_appointment/core/theming/font_weight_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TextStyles {
//   static TextStyle font24Black700Weight = TextStyle(
//     fontSize: 24.sp,
//     fontWeight: FontWeightHelper.bold,
//     color: Colors.black,
//   );

//   static TextStyle font32BlueBold = TextStyle(
//     fontSize: 32.sp,
//     fontWeight: FontWeightHelper.bold,
//     color: ColorsManager.mainBlue,
//   );
//   static TextStyle font24BlueBold = TextStyle(
//     fontSize: 24.sp,
//     fontWeight: FontWeightHelper.bold, //w700
//     color: ColorsManager.mainBlue,
//   );
//   static TextStyle font14GreyRegular = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeightHelper.regular,
//     color: Color(0xff6F6F6F),
//   );
//   static TextStyle font14lightGreyRegular = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeightHelper.regular,
//     color: ColorsManager.lightGrey,
//   );
//   static TextStyle font14DarkBlueMedium = TextStyle(
//     fontSize: 14.sp,
//     fontWeight: FontWeightHelper.medium,
//     color: ColorsManager.darkBlue,
//   );

//   static TextStyle font13GreyRegular = TextStyle(
//     fontSize: 13.sp,
//     fontWeight: FontWeightHelper.regular,
//     color: ColorsManager.grey,
//   );
//   static TextStyle font13BlueRegular = TextStyle(
//     fontSize: 13.sp,
//     fontWeight: FontWeightHelper.regular,
//     color: ColorsManager.mainBlue,
//   );
//   static TextStyle font16WhiteMedium = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeightHelper.medium,
//     color: Colors.white,
//   );
//   static TextStyle font16WhiteSemiBold = TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeightHelper.semiBold,
//     color: Colors.white,
//   );
//   static TextStyle font13DarkBlueRegular = TextStyle(
//     fontSize: 13.sp,
//     fontWeight: FontWeightHelper.regular,
//     color: ColorsManager.darkBlue,
//   );
// }




// import 'package:doctor_appointment/core/helpers/spacing.dart';
// import 'package:doctor_appointment/core/theming/styles.dart';
// import 'package:doctor_appointment/core/widgets/app_text_button.dart';
// import 'package:doctor_appointment/core/widgets/app_text_form_field.dart';
// import 'package:doctor_appointment/features/login/ui/widgets/already_have_account_text.dart';
// import 'package:doctor_appointment/features/login/ui/widgets/terms_and_conditions_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey formkey = GlobalKey<FormState>();
//   bool isObscureText = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Welcome Back', style: TextStyles.font24BlueBold),
//                 verticalSpacing(8),
//                 Text(
//                   "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
//                   style: TextStyles.font14GreyRegular,
//                 ),
//                 verticalSpacing(36),
//                 Form(
//                   key: formkey,
//                   child: Column(
//                     children: [
//                       const AppTextFormField(hintText: 'email'),
//                       verticalSpacing(18),
//                       AppTextFormField(
//                         hintText: 'password',
//                         isObscureText: isObscureText,
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isObscureText = !isObscureText;
//                             });
//                           },
//                           child: Icon(
//                             isObscureText
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                           ),
//                         ),
//                       ),
//                       verticalSpacing(24),
//                       Align(
//                         alignment: AlignmentDirectional.centerEnd,
//                         child: Text(
//                           'Forgot Password',
//                           style: TextStyles.font13BlueRegular,
//                         ),
//                       ),
//                       verticalSpacing(40),
//                       AppTextButton(
//                         buttonText: 'Login',
//                         textStyle: TextStyles.font16WhiteSemiBold,
//                         onPressed: () {},
//                       ),
//                       verticalSpacing(16),
//                       //
//                       TermsAndConditionsText(),
//                       verticalSpacing(32),
//                       AlreadyHaveAccountText(),

//                       //
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:doctor_appointment/core/theming/styles.dart';
// import 'package:flutter/widgets.dart';

// class TermsAndConditionsText extends StatelessWidget {
//   const TermsAndConditionsText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign: TextAlign.center,

//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'By Loggoing, you agree to our ',
//             style: TextStyles.font13GreyRegular,
//           ),
//           TextSpan(
//             text: 'Terms & Conditions ',
//             style: TextStyles.font13DarkBlueRegular,
//           ),
//           TextSpan(
//             text: 'and ',
//             style: TextStyles.font13GreyRegular.copyWith(height: 1.5),
//           ),
//           TextSpan(
//             text: 'PrivacyPolicy',
//             style: TextStyles.font13DarkBlueRegular,
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class FontWeightHelper {
//   static const FontWeight thin = FontWeight.w100;
//   static const FontWeight extraLight = FontWeight.w200;
//   static const FontWeight light = FontWeight.w300;
//   static const FontWeight regular = FontWeight.w400;
//   static const FontWeight medium = FontWeight.w500;
//   static const FontWeight semiBold = FontWeight.w600;
//   static const FontWeight bold = FontWeight.w700;
//   static const FontWeight extraBold = FontWeight.w800;
// }
