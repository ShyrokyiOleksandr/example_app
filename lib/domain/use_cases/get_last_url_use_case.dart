import 'package:avasoft_test/domain/repositories/i_app_repository.dart';

class GetLastUrlUseCase {
  final IAppRepository _iAppRepository;

  GetLastUrlUseCase({
    required IAppRepository iAppRepository,
  }) : _iAppRepository = iAppRepository;

  Future<String?> execute() async {
    return await _iAppRepository.getLastUrl();
  }
}
