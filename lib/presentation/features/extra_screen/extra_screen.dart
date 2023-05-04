import 'package:avasoft_test/presentation/common/widgets/app_logo/app_logo.dart';
import 'package:flutter/material.dart';

class ExtraScreen extends StatelessWidget {
  final String? message;

  const ExtraScreen({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const AppLogo(),
            Center(
              child: Text(
                message ?? "",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
