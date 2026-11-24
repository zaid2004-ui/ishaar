import 'package:json_annotation/json_annotation.dart';
part 'response_login.g.dart';

@JsonSerializable()
class ResponseLogin {
  final bool? success;
  final String? message;
  @JsonKey(name: 'otp_key')
  final String? otpKey;

  ResponseLogin({
    required this.success,
    required this.message,
    required this.otpKey,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginFromJson(json);
}
