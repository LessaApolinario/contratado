import 'package:contratado/interfaces/database/i_sql_database.dart';
import 'package:contratado/interfaces/repositories/i_user_repository.dart';
import 'package:contratado/models/user.dart';

class UserRepository implements IUserRepository {
  late ISQLDatabase<User> _database;

  UserRepository(ISQLDatabase<User> database) {
    _database = database;
  }

  @override
  Future<bool> find(String email) async {
    return await _database.find(email);
  }

  @override
  Future<bool> login(String email, String password) async {
    return await _database.login(email, password);
  }

  @override
  Future<bool> registerContractor(User user) async {
    return await _database.registerContractor(user);
  }

  @override
  Future<bool> registerServiceProvider(User user) async {
    return await _database.registerServiceProvider(user);
  }
}
