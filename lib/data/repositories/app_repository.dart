import 'package:avasoft_test/data/local_storage/app_local_storage.dart';
import 'package:avasoft_test/domain/repositories/i_app_repository.dart';

class AppRepository implements IAppRepository {
  final AppLocalStorage _appLocalStorage;

  AppRepository({
    required AppLocalStorage appLocalStorage,
  }) : _appLocalStorage = appLocalStorage;

  @override
  Future<int?> getAge() async {
    return await _appLocalStorage.getAge();
  }

  @override
  Future<void> storeAge(int age) async {
    await _appLocalStorage.storeAge(age);
  }

  @override
  Future<String?> getLastUrl() async {
    return await _appLocalStorage.getLastUrl();
  }

  @override
  Future<void> storeUrl(String url) async {
    await _appLocalStorage.storeUrl(url);
  }
}
