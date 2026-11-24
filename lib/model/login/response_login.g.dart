// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) =>
    ResponseLogin(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      otpKey: json['otp_key'] as String?,
    );

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'otp_key': instance.otpKey,
    };
