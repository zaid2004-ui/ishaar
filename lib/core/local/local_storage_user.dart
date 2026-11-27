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

  Future<String?> getTokens() => _storage.read(key: 'token');
  Future<String?> getRefreshToken() => _storage.read(key: 'refreshToken');
  Future<void> clear() async {
    await _storage.delete(key: 'token');

    await _storage.delete(key: 'refreshToken');
  }
}
