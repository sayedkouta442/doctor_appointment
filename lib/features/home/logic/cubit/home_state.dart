import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  //specialization
  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(
    List<SpecializationData?>? specializationDataList,
  ) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ErrorHandler errorHandler) =
      SpecializationsError;

  // Doctors
  //const factory HomeState.doctorsLoading() = DoctorsLoading;
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) =
      DoctorsSuccess;

  const factory HomeState.doctorsError(ErrorHandler errorHandler) =
      DoctorsError;
}
