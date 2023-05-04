import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'time_and_date_state.freezed.dart';

@freezed
class TimeAndDateState with _$TimeAndDateState {
  const factory TimeAndDateState({
    required bool isLoading,
    required WebViewController? controller,
  }) = _TimeAndDateState;

  factory TimeAndDateState.initial() {
    return const TimeAndDateState(
      controller: null,
      isLoading: false,
    );
  }
}
