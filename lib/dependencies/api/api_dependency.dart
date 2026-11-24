import 'package:ishaar/core/api/api_services.dart';
import 'package:ishaar/dependencies/dio/dio_dependency.dart';

class ApiDependency {
  static final ApiService apiService = ApiService(DioDependency.dio);
}
