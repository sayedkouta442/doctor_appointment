import 'package:dio/dio.dart';
import 'package:doctor_appointment/core/networking/api_constants.dart';

import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  @GET("/specialization/index")
  Future<SpecializationResponseModel> getSpecialization();
}
