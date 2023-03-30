import 'dart:async';

import 'package:contratado/src/core/domain/models/user.dart';
import 'package:contratado/src/core/interfaces/adapters/user_adapter.dart';
import 'package:contratado/src/infra/sqlite/base_sqlite_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserSQLiteRepository extends BaseSQLiteRepository implements UserAdapter {
  @override
  Future<bool> create(User user) async {
    String sql =
        "INSERT INTO users (type, name, email, cpf, password, phone, specialty) VALUES (?, ?, ?, ?, ?, ?, ?);";
    Database database = await connect();
    final result = await database.rawInsert(sql, [
      user.type,
      user.name,
      user.email,
      user.cpf,
      user.password,
      user.phone,
      user.specialty
    ]);

    if (result > 0) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> findByEmail(String email) async {
    String sql = "SELECT * FROM users WHERE email = ?;";
    Database database = await connect();
    final result = await database.rawQuery(sql, [email]);

    if (result.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> login(String email, String password) async {
    String sql =
        "SELECT email, password FROM users WHERE email=? AND password=?;";
    Database database = await connect();
    final result = await database.rawQuery(sql, [email, password]);

    if (result.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE users(ID INTEGER PRIMARY KEY AUTOINCREMENT, type VARCHAR(50) CHECK type IN ('service provider', 'contractor'), name VARCHAR(100), email VARCHAR(50), cpf VARCHAR(14), password VARCHAR(50), phone VARCHAR(20), specialty VARCHAR(50));";
    await db.execute(sql);

    sql =
        "INSERT INTO users(type, name, email, cpf, password) VALUES ('contractor', 'Lucas', 'lucas@example.com', '348.899.460-04', 'lucas123');";
    await db.execute(sql);
    sql =
        "INSERT INTO users(type, name, email, cpf, password) VALUES ('contractor', 'Juliana', 'juliana@example.com', '321.100.720-24', 'juliana123');";

    sql =
        "INSERT INTO users(type, name, email, cpf, password, phone, specialty) VALUES ('service provider', 'Julia', 'julia@example.com', '148.283.000-07', 'julia123', '(00) 90000-0000', 'Carpinteiro');";
    await db.execute(sql);

    sql =
        "INSERT INTO users(type, name, email, cpf, password, phone, specialty) VALUES ('service provider', 'Jéssica', 'jessica@example.com', '099.377.990-58', 'jessica123', '(00) 91111-1111', 'Empregada doméstica');";
    await db.execute(sql);
  }

  @override
  Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'contratado.db');

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }
}
