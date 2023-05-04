import 'package:avasoft_test/presentation/features/time_and_date/bloc/time_and_date_cubit.dart';
import 'package:avasoft_test/presentation/features/time_and_date/bloc/time_and_date_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TimeAndDateScreen extends StatelessWidget {
  TimeAndDateScreen({Key? key}) : super(key: key);

  late final _screenBloc = GetIt.I<TimeAndDateCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeAndDateCubit, TimeAndDateState>(
      bloc: _screenBloc,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (await state.controller?.canGoBack() ?? false) {
              state.controller?.goBack();
              return false;
            }
            return true;
          },
          child: Scaffold(
            body: SafeArea(
              child: state.controller != null && !state.isLoading
                  ? WebViewWidget(controller: state.controller!)
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
}
