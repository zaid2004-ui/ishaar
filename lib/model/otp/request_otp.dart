import 'package:json_annotation/json_annotation.dart';

part 'request_otp.g.dart';

@JsonSerializable()
class RequestOtp {
  final String key;
  final String code;

  RequestOtp({required this.key, required this.code});

  Map<String, dynamic> toJson() => _$RequestOtpToJson(this);
}
