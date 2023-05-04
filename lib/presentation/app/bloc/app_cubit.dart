import 'package:avasoft_test/domain/use_cases/get_age_use_case.dart';
import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:avasoft_test/presentation/app/bloc/app_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  final GetAgeUseCase _getAgeUseCase;
  final IAgeValidator _iAgeValidator;
  final _connectivity = Connectivity();

  AppCubit({
    required GetAgeUseCase getAgeUseCase,
    required IAgeValidator iAgeValidator,
  })  : _getAgeUseCase = getAgeUseCase,
        _iAgeValidator = iAgeValidator,
        super(AppState.initial()) {
    _checkInternet();
    _loadUserAge();
  }

  void _checkInternet() async {
    final result = await _connectivity.checkConnectivity();
    emit(state.copyWith(hasInternet: !(result == ConnectivityResult.none)));
  }

  void _loadUserAge() async {
    final age = await _getAgeUseCase.execute();
    emit(state.copyWith(age: age, validationStatus: _iAgeValidator.validate(age)));
  }
}
