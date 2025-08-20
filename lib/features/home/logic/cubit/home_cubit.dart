import 'package:doctor_appointment/core/helpers/extensions.dart';
import 'package:doctor_appointment/core/networking/api_error_handler.dart';
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

        getDoctorsList(
          specializayionId: specializationDataList?.first?.id ?? 1,
        ); //.first?.id
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

  void getDoctorsList({required int specializayionId}) async {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializayionId,
    );
    !doctorsList.isNullOrEmpty()
        ? emit(DoctorsSuccess(doctorsList))
        : emit(
            DoctorsError(
              ErrorHandler.handle('No Doctors Found for this Specialization'),
            ),
          );
  }

  // return list of doctors by specialization id
  getDoctorsListBySpecializationId(int specializaionID) {
    return specializationDataList
        ?.firstWhere((specializaion) => specializaion?.id == specializaionID)
        ?.doctorsList;
  }
}
