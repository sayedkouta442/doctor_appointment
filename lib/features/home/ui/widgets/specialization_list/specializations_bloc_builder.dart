import 'package:doctor_appointment/core/helpers/spacing.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_state.dart';
import 'package:doctor_appointment/features/home/ui/widgets/doctors_list/doctor_shimmer_loading.dart';
import 'package:doctor_appointment/features/home/ui/widgets/specialization_list/speciality_list_view.dart';
import 'package:doctor_appointment/features/home/ui/widgets/specialization_list/speciality_shimmer_loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

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
          specializationsSuccess: (specializationDataList) {
            var specializationList = specializationDataList;
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
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpacing(8),
          const DoctorShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupSuccess(specializationList) {
    return SpecialityListView(specializationData: specializationList ?? []);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
