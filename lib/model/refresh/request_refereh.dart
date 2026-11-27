import 'package:json_annotation/json_annotation.dart';
part 'request_refereh.g.dart';

@JsonSerializable()
class RequestRefereh {
  final String refreshToken;

  new({required this.refreshToken});
  Map<String, dynamic> toJson() => _$RequestReferehToJson(this);
}
