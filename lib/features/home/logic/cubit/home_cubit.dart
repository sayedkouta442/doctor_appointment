import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment/features/home/data/repos/home_repo.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;

  List<SpecializationData?>? specializationDataList = [];
  void getSpecializations() async {
    emit(HomeState.specializationsLoading());

    final response = await _homeRepo.getSpecilization();

    response.when(
      success: (specializationResponseModel) {
        specializationDataList =
            specializationResponseModel.specializationDataList ?? [];
        emit(
          HomeState.specializationsSuccess(
            specializationResponseModel.specializationDataList,
          ),
        );
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
}
