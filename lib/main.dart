import 'package:avasoft_test/presentation/app/avasoft_test_app.dart';
import 'package:avasoft_test/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.setup();

  runApp(AvasoftTestApp());
}
