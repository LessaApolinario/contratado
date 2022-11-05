import 'package:contratado/database/sqlite_database.dart';
import 'package:contratado/interfaces/database/i_sql_database.dart';
import 'package:contratado/interfaces/repositories/i_user_repository.dart';
import 'package:contratado/interfaces/services/i_user_service.dart';
import 'package:contratado/models/user.dart';
import 'package:contratado/repositories/user_repository.dart';
import 'package:contratado/services/user_service.dart';

class UserController {
  Future<bool> login(String email, String password) async {
    ISQLDatabase<User> database = SQLiteDatabase();
    IUserRepository userRepository = UserRepository(database);
    IUserService userService = UserService(userRepository);

    final bool result = await userService.login(email, password);

    return result;
  }

  Future<bool> registerContractor(User user) async {
    ISQLDatabase<User> database = SQLiteDatabase();
    IUserRepository userRepository = UserRepository(database);
    IUserService userService = UserService(userRepository);

    final bool result = await userService.registerContractor(user);

    return result;
  }

  Future<bool> registerServiceProvider(User user) async {
    ISQLDatabase<User> database = SQLiteDatabase();
    IUserRepository userRepository = UserRepository(database);
    IUserService userService = UserService(userRepository);

    final bool result = await userService.registerServiceProvider(user);

    return result;
  }
}
