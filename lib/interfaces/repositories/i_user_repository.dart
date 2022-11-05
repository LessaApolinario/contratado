import 'package:contratado/models/user.dart';

abstract class IUserRepository {
  Future<bool> login(String email, String password);

  Future<bool> find(String email);

  Future<bool> registerContractor(User user);

  Future<bool> registerServiceProvider(User user);
}
