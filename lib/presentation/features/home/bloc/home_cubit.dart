import 'package:avasoft_test/domain/use_cases/store_age_use_case.dart';
import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:avasoft_test/presentation/features/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final IAgeValidator _iAgeValidator;
  final StoreAgeUseCase _storeAgeUseCase;

  HomeCubit({
    required StoreAgeUseCase storeAgeUseCase,
    required IAgeValidator iAgeValidator,
  })  : _storeAgeUseCase = storeAgeUseCase,
        _iAgeValidator = iAgeValidator,
        super(HomeState.initial());

  void submitAge(String age) async {
    emit(state.copyWith(
      age: int.tryParse(age),
      validationStatus: _iAgeValidator.validate(int.tryParse(age)),
    ));
    final shouldStoreAge =
        (state.validationStatus == AgeValidationStatus.underage || state.validationStatus == AgeValidationStatus.valid);
    if (shouldStoreAge) {
      await _storeAgeUseCase.execute(state.age!);
    }
  }
}
