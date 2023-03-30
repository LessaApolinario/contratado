import 'package:contratado/src/core/domain/models/user.dart';
import 'package:contratado/src/core/interfaces/adapters/user_adapter.dart';

abstract class IUserService {
  UserAdapter adapter;

  IUserService(this.adapter);

  Future<bool> login(String email, String password);

  Future<bool> create(User user);

  Future<bool> findByEmail(String email);
}
