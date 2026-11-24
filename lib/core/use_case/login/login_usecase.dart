import 'package:dartz/dartz.dart';
import 'package:ishaar/features/login/repo/login_repo.dart';
import 'package:ishaar/model/login/request_login.dart';

class LoginUsecase {
  final LoginRepo repository;

  new({required this.repository});

  Future<Either<String, dynamic>> call(RequestLogin request) {
    return repository.login(request);
  }
}
