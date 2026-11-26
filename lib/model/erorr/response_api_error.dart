import 'package:json_annotation/json_annotation.dart';
part 'response_api_error.g.dart';

@JsonSerializable()
class ResponseApiError {
  final bool? success;
  final String? message;
  final String? errorCode;

  ResponseApiError({this.success, this.message, this.errorCode});

  factory ResponseApiError.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiErrorFromJson(json);
}
