import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItems extends StatelessWidget {
  final int itemsIndex;
  final Doctors? doctorsModel;
  const DoctorsListViewItems({
    super.key,
    required this.itemsIndex,
    this.doctorsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        // color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/doctor_image.png',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpacing(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorsModel?.name ?? '',
                  style: TextStyles.font16darkGreyBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${doctorsModel?.degree} | ${doctorsModel?.phone} ',
                  // 'General | RSUD Gatot Subroto',
                  style: TextStyles.font12GreyRegular.copyWith(height: 2),

                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  doctorsModel?.email ?? 'email',
                  //'email@gmail.com',
                  style: TextStyles.font12GreyRegular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
