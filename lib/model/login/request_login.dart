import 'package:json_annotation/json_annotation.dart';

part 'request_login.g.dart';

@JsonSerializable()
class RequestLogin {
  final String username;
  final String password;

  new({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$RequestLoginToJson(this);
}
