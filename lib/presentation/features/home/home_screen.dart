import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:avasoft_test/presentation/common/extensions/build_context_extensions.dart';
import 'package:avasoft_test/presentation/common/widgets/app_logo/app_logo.dart';
import 'package:avasoft_test/presentation/common/widgets/buttons/app_submit_button.dart';
import 'package:avasoft_test/presentation/common/widgets/text_fields/app_age_field.dart';
import 'package:avasoft_test/presentation/features/extra_screen/extra_screen.dart';
import 'package:avasoft_test/presentation/features/time_and_date/time_and_date_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/home_cubit.dart';
import 'bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  late final _screenBloc = GetIt.I<HomeCubit>();
  final _ageController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: _screenBloc,
      listener: (context, state) {
        if (state.validationStatus == AgeValidationStatus.overage) {
          _showSnackBar(context, context.strings.homeEnterRealAge);
        }
        if (state.validationStatus == AgeValidationStatus.underage) {
          _denyPermission(context);
        }
        if (state.validationStatus == AgeValidationStatus.valid) {
          _openTimeAndDate(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: FocusScope.of(context).unfocus,
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const AppLogo(),
                  Center(
                    child: Row(
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: AppAgeField(
                            controller: _ageController,
                            errorText: state.validationStatus == AgeValidationStatus.empty
                                ? context.strings.homeAgeIsEmpty
                                : null,
                            onFieldSubmitted: (_) => _submitAge(context, _ageController.text),
                          ),
                        ),
                        const SizedBox(width: 14),
                        AppSubmitButton(onPressed: () => _submitAge(context, _ageController.text)),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitAge(BuildContext context, String age) {
    FocusScope.of(context).unfocus();
    _screenBloc.submitAge(age);
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _denyPermission(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ExtraScreen(message: context.strings.extraAccessDenied);
        },
      ),
    );
  }

  void _openTimeAndDate(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TimeAndDateScreen(),
      ),
    );
  }
}
