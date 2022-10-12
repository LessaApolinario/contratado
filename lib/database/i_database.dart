abstract class IDatabase {
  Future<List<Map<String, Object?>>> findContractors();
  Future<List<Map<String, Object?>>> findServiceProviders();
  Future<bool> login(String email, String password);
  Future<bool> registerContractor(
      String type, String name, String email, String cpf, String password);
  Future<bool> registerServiceProvider(String type, String name, String email,
      String cpf, String password, String phone, String specialty);
  Future<void> close();
}
