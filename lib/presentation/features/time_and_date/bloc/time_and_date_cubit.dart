import 'dart:ui';

import 'package:avasoft_test/domain/use_cases/get_last_url_use_case.dart';
import 'package:avasoft_test/domain/use_cases/store_url_use_case.dart';
import 'package:avasoft_test/presentation/features/time_and_date/bloc/time_and_date_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TimeAndDateCubit extends Cubit<TimeAndDateState> {
  static const _defaultUrl = "https://www.timeanddate.com/weather/ukraine/kyiv/ext";

  final GetLastUrlUseCase _getLastUrlUseCase;
  final StoreUrlUseCase _storeUrlUseCase;

  TimeAndDateCubit({
    required GetLastUrlUseCase getLastUrlUseCase,
    required StoreUrlUseCase storeUrlUseCase,
  })  : _getLastUrlUseCase = getLastUrlUseCase,
        _storeUrlUseCase = storeUrlUseCase,
        super(TimeAndDateState.initial()) {
    _loadLastUrl();
    _initiateController();
  }

  void _initiateController() async {
    emit(
      state.copyWith(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                emit(state.copyWith(isLoading: true));
              },
              onProgress: (int progress) {
                emit(state.copyWith(isLoading: progress < 100));
              },
              onPageFinished: (String url) {
                emit(state.copyWith(isLoading: false));
                storeUrl(url);
              },
              onWebResourceError: (WebResourceError error) {
                print('Page resource error: /n'
                    'code: ${error.errorCode}/n'
                    'description: ${error.description}/n'
                    'errorType: ${error.errorType}/n'
                    'isForMainFrame: ${error.isForMainFrame}');
              },
            ),
          ),
      ),
    );
  }

  void _loadLastUrl() async {
    final url = await _getLastUrlUseCase.execute();
    if (state.controller != null) {
      state.controller!.loadRequest(Uri.parse(url ?? _defaultUrl));
    }
  }

  void storeUrl(String url) async {
    await _storeUrlUseCase.execute(url);
  }
}
