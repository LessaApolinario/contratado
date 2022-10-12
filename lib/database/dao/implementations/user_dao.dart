import 'package:contratado/database/dao/i_user_dao.dart';
import 'package:contratado/database/i_database.dart';
import 'package:contratado/models/user.dart';

class UserDAO implements IUserDAO {
  late IDatabase _database;

  UserDAO(IDatabase database) {
    _database = database;
  }

  @override
  Future<bool> login(String email, String password) async {
    final result = await _database.login(email, password);
    await _database.close();
    return result;
  }

  @override
  Future<bool> registerContractor(User user) async {
    final result = await _database.registerContractor(user);
    await _database.close();
    return result;
  }

  @override
  Future<bool> registerServiceProvider(User user) async {
    final result = await _database.registerServiceProvider(user);
    await _database.close();
    return result;
  }
}
