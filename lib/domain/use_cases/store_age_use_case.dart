import 'package:avasoft_test/domain/repositories/i_app_repository.dart';

class StoreAgeUseCase {
  final IAppRepository _iAppRepository;

  StoreAgeUseCase({
    required IAppRepository iAppRepository,
  }) : _iAppRepository = iAppRepository;

  Future<void> execute(int age) async {
    await _iAppRepository.storeAge(age);
  }
}
