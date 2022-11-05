import 'package:contratado/models/user.dart';

abstract class IUserService {
  Future<bool> login(String email, String password);

  Future<bool> registerContractor(User user);

  Future<bool> registerServiceProvider(User user);
}