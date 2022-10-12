import 'package:contratado/models/user.dart';

abstract class IDAO {
  Future<List<User>> findContractors();
  Future<List<User>> findServiceProviders();
  Future<bool> login(String email, String password);
  Future<bool> registerContractor(
      String type, String name, String email, String cpf, String password);
  Future<bool> registerServiceProvider(String type, String name, String email,
      String cpf, String password, String phone, String specialty);
}
