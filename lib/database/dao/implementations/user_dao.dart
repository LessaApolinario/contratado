import 'package:contratado/database/dao/i_dao.dart';
import 'package:contratado/database/i_database.dart';
import 'package:contratado/models/user.dart';

class UserDAO implements IDAO {
  late IDatabase _database;

  UserDAO(IDatabase database) {
    _database = database;
  }

  @override
  Future<List<User>> findContractors() async {
    List<User> contractors = <User>[];
    final result = await _database.findContractors();

    for (var json in result) {
      User user = User.fromJson(json);
      contractors.add(user);
    }

    await _database.close();

    return contractors;
  }

  @override
  Future<List<User>> findServiceProviders() async {
    List<User> serviceProviders = <User>[];
    final result = await _database.findServiceProviders();

    for (var json in result) {
      User user = User.fromJson(json);
      serviceProviders.add(user);
    }

    await _database.close();

    return serviceProviders;
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
