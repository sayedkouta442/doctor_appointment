import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctors_list_view.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:doctor_appointment/features/home/ui/widgets/home_top_bar.dart';
import 'package:doctor_appointment/features/home/ui/widgets/specialization_and_doctors_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(16, 20, 16, 16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              DoctorsBlueContainer(),
              verticalSpacing(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpacing(18),
              SpecializationAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
