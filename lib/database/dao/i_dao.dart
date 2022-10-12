import 'package:contratado/models/user.dart';

abstract class IDAO {
  Future<List<User>> findContractors();
  Future<List<User>> findServiceProviders();
  Future<bool> login(String email, String password);
  Future<bool> registerContractor(User user);
  Future<bool> registerServiceProvider(User user);
}
