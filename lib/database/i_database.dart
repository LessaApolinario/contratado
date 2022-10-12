import 'package:contratado/models/user.dart';

abstract class IDatabase {
  Future<List<Map<String, Object?>>> findContractors();
  Future<List<Map<String, Object?>>> findServiceProviders();
  Future<bool> login(String email, String password);
  Future<bool> registerContractor(User user);
  Future<bool> registerServiceProvider(User user);
  Future<void> close();
}
