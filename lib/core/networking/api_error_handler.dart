import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = ApiErrorModel(
        "Something went wrong, please try again later.",
        null,
      );
    }
  }

  ApiErrorModel _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel("Connection timeout, please try again.", null);

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        if (data is Map<String, dynamic>) {
          try {
            return ApiErrorModel.fromJson(data);
          } catch (_) {
            return ApiErrorModel("Server error: $statusCode", statusCode);
          }
        }
        return ApiErrorModel("Server error: $statusCode", statusCode);

      case DioExceptionType.cancel:
        return ApiErrorModel("Request cancelled.", null);

      case DioExceptionType.connectionError:
        return ApiErrorModel("No internet connection.", null);

      case DioExceptionType.unknown:
      default:
        return ApiErrorModel("Unexpected error occurred.", null);
    }
  }
}
