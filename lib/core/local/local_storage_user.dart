import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageUser {
  LocalStorageUser._();
  static final LocalStorageUser instance = LocalStorageUser._();
  final _storage = const FlutterSecureStorage();

  Future<void> saveTokens({
    required String token,
    required String refreshToken,
  }) async {
    await _storage.write(key: 'token', value: token);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }
}
