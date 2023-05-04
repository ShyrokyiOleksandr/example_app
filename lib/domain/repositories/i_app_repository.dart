abstract class IAppRepository {
  Future<void> storeAge(int age);

  Future<int?> getAge();

  Future<void> storeUrl(String url);

  Future<String?> getLastUrl();
}
