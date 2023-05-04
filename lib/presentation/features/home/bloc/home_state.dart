import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required int? age,
    required AgeValidationStatus validationStatus,
  }) = _HomeState;

  factory HomeState.initial() {
    return const HomeState(
      age: null,
      validationStatus: AgeValidationStatus.unvalidated,
    );
  }
}
