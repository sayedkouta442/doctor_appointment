import 'package:doctor_appointment/core/networking/api_error_handler.dart';
import 'package:doctor_appointment/core/networking/api_result.dart';
import 'package:doctor_appointment/features/home/data/apis/home_api_service.dart';
import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecilization() async {
    try {
      var result = await _homeApiService.getSpecialization();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
