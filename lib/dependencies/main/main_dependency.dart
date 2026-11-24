import 'package:flutter/material.dart';
import 'package:ishaar/dependencies/local_storage/local_storage_dependency.dart';

class MainDependency {
  static Future<void> mainDependency() async {
    WidgetsFlutterBinding.ensureInitialized();

    await LocalStorageDependency.initLocalStorageDependency();
  }
}
