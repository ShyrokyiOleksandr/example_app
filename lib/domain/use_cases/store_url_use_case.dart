import 'package:avasoft_test/domain/repositories/i_app_repository.dart';

class StoreUrlUseCase {
  final IAppRepository _iAppRepository;

  StoreUrlUseCase({
    required IAppRepository iAppRepository,
  }) : _iAppRepository = iAppRepository;

  Future<void> execute(String url) async {
    await _iAppRepository.storeUrl(url);
  }
}
