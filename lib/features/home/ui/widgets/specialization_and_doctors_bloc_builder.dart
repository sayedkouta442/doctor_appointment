import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setupLoading();
          },
          specializationsSuccess: (specializationResponseModel) {
            var specializationList = specializationResponseModel;
            return setupSuccess(specializationList);
          },
          specializationsError: (errorHandler) => setupError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget setupLoading() {
    return SizedBox(height: 100, child: CircularProgressIndicator());
  }

  Widget setupSuccess(specializationList) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityListView(
            specializationData: specializationList ?? [],
          ),
          verticalSpacing(8),
          DoctorsListView(doctorsList: specializationList?[0]?.doctorsList),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
