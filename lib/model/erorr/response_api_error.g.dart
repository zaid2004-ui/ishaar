// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseApiError _$ResponseApiErrorFromJson(Map<String, dynamic> json) =>
    ResponseApiError(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ResponseApiErrorToJson(ResponseApiError instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'error': instance.error,
    };
