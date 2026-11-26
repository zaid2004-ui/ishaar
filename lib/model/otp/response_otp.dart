import 'package:json_annotation/json_annotation.dart';
part 'response_otp.g.dart';

@JsonSerializable()
class ResponseOtp {
  final bool? success;
  final String? message;
  final String? token;
  final String? refreshToken;

  new({
    required this.success,
    required this.message,
    required this.token,
    required this.refreshToken,
  });

  factory ResponseOtp.fromJson(Map<String, dynamic> json) =>
      _$ResponseOtpFromJson(json);
}
