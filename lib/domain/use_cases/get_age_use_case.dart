import 'package:avasoft_test/domain/repositories/i_app_repository.dart';

class GetAgeUseCase {
  final IAppRepository _iAppRepository;

  GetAgeUseCase({
    required IAppRepository iAppRepository,
  }) : _iAppRepository = iAppRepository;

  Future<int?> execute() async {
    return await _iAppRepository.getAge();
  }
}
