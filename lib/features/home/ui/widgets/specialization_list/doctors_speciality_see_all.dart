import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Doctor Speciality', style: TextStyles.font18BlackSemiBold),
        Text('See All', style: TextStyles.font12BlueRegular),
      ],
    );
  }
}
