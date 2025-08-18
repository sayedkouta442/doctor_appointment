import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorsSpecialityListViewItem extends StatelessWidget {
  const DoctorsSpecialityListViewItem({
    super.key,
    this.specializationData,
    required this.itemIndex,
  });
  final SpecializationData? specializationData;
  final int itemIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xffF4F8FF),
            child: SvgPicture.asset(
              'assets/svgs/notification.svg',
              width: 24.w,
              height: 24.h,
              //    fit: BoxFit.contain,
            ),
          ),
          verticalSpacing(16),
          Text(
            specializationData?.name ?? '',
            style: TextStyles.font12DarkGreyRegular,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
