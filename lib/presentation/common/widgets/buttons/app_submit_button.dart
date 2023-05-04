import 'package:avasoft_test/presentation/common/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class AppSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AppSubmitButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(context.strings.homeSubmitAction),
    );
  }
}
