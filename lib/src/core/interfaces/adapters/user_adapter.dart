import 'package:contratado/src/core/domain/models/user.dart';

abstract class UserAdapter {
  Future<bool> login(String email, String password);

  Future<bool> create(User user);

  Future<bool> findByEmail(String email);
}
