import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/core/theming/colors.dart';
import 'package:doctor_appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi, Omar!', style: TextStyles.font18DarkBlueBold),
            verticalSpacing(4),
            Text('How Are You Today?', style: TextStyles.font12GreyRegular),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.moreLighterGrey,
          child: SvgPicture.asset('assets/svgs/notification.svg'),
        ),
      ],
    );
  }
}
