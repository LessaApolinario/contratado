import 'package:contratado/src/core/domain/models/user.dart';
import 'package:contratado/src/core/interfaces/services/i_user_service.dart';

class UserService extends IUserService {
  UserService(super.adapter);

  @override
  Future<bool> create(User user) {
    return adapter.create(user);
  }

  @override
  Future<bool> findByEmail(String email) {
    return adapter.findByEmail(email);
  }

  @override
  Future<bool> login(String email, String password) {
    return adapter.login(email, password);
  }
}
