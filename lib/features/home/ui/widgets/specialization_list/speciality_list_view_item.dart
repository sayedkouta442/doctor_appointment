import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/theming/colors.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    this.specializationData,
    required this.itemIndex,
    required this.selectedIndex,
  });
  final SpecializationData? specializationData;
  final int selectedIndex;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          itemIndex == selectedIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManager.darkBlue),

                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xffF4F8FF),
                    child: SvgPicture.asset(
                      'assets/svgs/notification.svg',
                      width: 38.w,
                      height: 38.h,
                      //    fit: BoxFit.contain,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xffF4F8FF),
                  child: SvgPicture.asset(
                    'assets/svgs/notification.svg',
                    width: 36.w,
                    height: 36.h,
                    //    fit: BoxFit.contain,
                  ),
                ),
          verticalSpacing(16),
          Text(
            specializationData?.name ?? '',
            style: itemIndex == selectedIndex
                ? TextStyles.font14DarkBlueMedium
                : TextStyles.font12DarkGreyRegular,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
