import 'package:flutter/material.dart';
import 'package:ishaar/dependencies/main/main_dependency.dart';
import 'package:ishaar/features/app/ishaar_app.dart';

void main() async {
  await MainDependency.mainDependency();
  runApp(const IshaarApp());
}
