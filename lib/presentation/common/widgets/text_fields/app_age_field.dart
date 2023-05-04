import 'package:avasoft_test/presentation/common/extensions/build_context_extensions.dart';
import 'package:avasoft_test/presentation/common/input_formatters/number_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAgeField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final void Function(String)? onFieldSubmitted;

  const AppAgeField({
    required this.controller,
    required this.errorText,
    required this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: context.strings.homeAgeHint,
        errorText: errorText,
      ),
      keyboardType: const TextInputType.numberWithOptions(),
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
        NumberInputFormatter(),
      ],
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
