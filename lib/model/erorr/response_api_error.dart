import 'package:json_annotation/json_annotation.dart';
part 'response_api_error.g.dart';

@JsonSerializable()
class ResponseApiError {
  final bool? success;
  final String? message;
  final String? error;

  ResponseApiError({this.success, this.message, this.error});

  factory ResponseApiError.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiErrorFromJson(json);
}
