import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required int? age,
    required AgeValidationStatus validationStatus,
    required bool hasInternet,
  }) = _AppState;

  factory AppState.initial() {
    return const AppState(
      age: null,
      validationStatus: AgeValidationStatus.unvalidated,
      hasInternet: false,
    );
  }
}
