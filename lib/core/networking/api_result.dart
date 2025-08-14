import 'package:freezed_annotation/freezed_annotation.dart';
import 'api_error_handler.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}





// read freezed docs




// flutter pub run build_runner build --delete-conflicting-outputs












// abstract class ApiResult<T> {
//   const ApiResult();

//   R when<R>({
//     required R Function(T data) success,
//     required R Function(String message) failure,
//   });
// }

// class Success<T> extends ApiResult<T> {
//   final T data;

//   const Success(this.data);

//   @override
//   R when<R>({
//     required R Function(T data) success,
//     required R Function(String message) failure,
//   }) {
//     return success(data);
//   }
// }

// class Failure<T> extends ApiResult<T> {
//   final String message;

//   const Failure(this.message);

//   @override
//   R when<R>({
//     required R Function(T data) success,
//     required R Function(String message) failure,
//   }) {
//     return failure(message);
//   }
// }