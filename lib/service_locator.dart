import 'package:avasoft_test/data/local_storage/app_local_storage.dart';
import 'package:avasoft_test/data/repositories/app_repository.dart';
import 'package:avasoft_test/data/validators/age_validator.dart';
import 'package:avasoft_test/domain/repositories/i_app_repository.dart';
import 'package:avasoft_test/domain/use_cases/get_age_use_case.dart';
import 'package:avasoft_test/domain/use_cases/get_last_url_use_case.dart';
import 'package:avasoft_test/domain/use_cases/store_age_use_case.dart';
import 'package:avasoft_test/domain/use_cases/store_url_use_case.dart';
import 'package:avasoft_test/domain/validators/i_age_validator.dart';
import 'package:avasoft_test/presentation/app/bloc/app_cubit.dart';
import 'package:avasoft_test/presentation/features/home/bloc/home_cubit.dart';
import 'package:avasoft_test/presentation/features/time_and_date/bloc/time_and_date_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class AppServiceLocator {
  static Future<void> setup() async {
    //storages
    GetIt.I.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance(),
    );
    GetIt.I.registerFactory<AppLocalStorage>(
      () => AppLocalStorage(
        sharedPreferences: GetIt.I<SharedPreferences>(),
      ),
    );

    // repositories
    GetIt.I.registerFactory<IAppRepository>(
      () => AppRepository(
        appLocalStorage: GetIt.I<AppLocalStorage>(),
      ),
    );

    // use cases
    GetIt.I.registerFactory<GetAgeUseCase>(
      () => GetAgeUseCase(
        iAppRepository: GetIt.I<IAppRepository>(),
      ),
    );
    GetIt.I.registerFactory<StoreAgeUseCase>(
      () => StoreAgeUseCase(
        iAppRepository: GetIt.I<IAppRepository>(),
      ),
    );
    GetIt.I.registerFactory<StoreUrlUseCase>(
      () => StoreUrlUseCase(
        iAppRepository: GetIt.I<IAppRepository>(),
      ),
    );
    GetIt.I.registerFactory<GetLastUrlUseCase>(
      () => GetLastUrlUseCase(
        iAppRepository: GetIt.I<IAppRepository>(),
      ),
    );

    // validators
    GetIt.I.registerFactory<IAgeValidator>(() => AgeValidator());

    // blocs
    GetIt.I.registerFactory<AppCubit>(
      () => AppCubit(
        iAgeValidator: GetIt.I<IAgeValidator>(),
        getAgeUseCase: GetIt.I<GetAgeUseCase>(),
      ),
    );
    GetIt.I.registerFactory<HomeCubit>(
      () => HomeCubit(
        storeAgeUseCase: GetIt.I<StoreAgeUseCase>(),
        iAgeValidator: GetIt.I<IAgeValidator>(),
      ),
    );
    GetIt.I.registerFactory<TimeAndDateCubit>(
      () => TimeAndDateCubit(
        storeUrlUseCase: GetIt.I<StoreUrlUseCase>(),
        getLastUrlUseCase: GetIt.I<GetLastUrlUseCase>(),
        // iAgeValidator: GetIt.I<IAgeValidator>(),
      ),
    );
  }
}
