import 'package:json_annotation/json_annotation.dart';

part 'request_login.g.dart';

@JsonSerializable()
class RequestLogin {
  final String username;
  final String password;

  new({required this.username, required this.password});

  factory RequestLogin.fromJson(Map<String, dynamic> json) {
    return _$RequestLoginFromJson(json);
  }
  Map<String, dynamic> toJson() => _$RequestLoginToJson(this);
}
