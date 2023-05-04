import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:avasoft_test/presentation/app/bloc/app_cubit.dart';
import 'package:avasoft_test/presentation/app/bloc/app_state.dart';
import 'package:avasoft_test/presentation/common/extensions/build_context_extensions.dart';
import 'package:avasoft_test/presentation/features/extra_screen/extra_screen.dart';
import 'package:avasoft_test/presentation/features/home/home_screen.dart';
import 'package:avasoft_test/presentation/features/time_and_date/time_and_date_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class AvasoftTestApp extends StatelessWidget {
  static const appTitle = "Avasoft Test";

  late final _appBloc = GetIt.I<AppCubit>();

  AvasoftTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
      ],
      home: BlocBuilder<AppCubit, AppState>(
        bloc: _appBloc,
        builder: (context, state) {
          if (state.hasInternet) {
            if (state.age != null) {
              if (state.validationStatus == AgeValidationStatus.underage) {
                return ExtraScreen(message: context.strings.extraAccessDenied);
              }
              return TimeAndDateScreen();
            }
            return HomeScreen();
          } else {
            return ExtraScreen(message: context.strings.extraNoInternet);
          }
        },
      ),
    );
  }
}
