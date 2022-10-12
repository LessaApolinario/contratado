import "dart:async";

import "package:contratado/database/i_database.dart";
import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";

class SQLiteDatabase implements IDatabase {
  late Database _db;

  Future<Database> get db async {
    _db = await _initDB();
    return _db;
  }

  _initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'contratado.db');

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE users(user_id INTEGER PRIMARY KEY AUTOINCREMENT, type VARCHAR(50) NOT NULL, name VARCHAR(100) NOT NULL, email VARCHAR(50) NOT NULL, cpf VARCHAR(14) NOT NULL, password VARCHAR(50) NOT NULL, phone VARCHAR(20), specialty VARCHAR(50));";
    await db.execute(sql);

    sql =
        "CREATE TABLE publications(publication_id INTEGER PRIMARY KEY AUTOINCREMENT, username VARCHAR(100) NOT NULL, description VARCHAR(50) NOT NULL, phone VARCHAR(20), email VARCHAR(50) NOT NULL, user_description VARCHAR(255) NOT NULL, FOREIGN KEY (publication_id) REFERENCES users(user_id));";

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

    sql =
        "INSERT INTO publications(username, description, email, user_description) VALUES ('Lucas', 'Procura-se Carpinteiro', 'lucas@example.com', 'Procuro alguém com mais experiências profissionais.');";
    await db.execute(sql);

    sql =
        "INSERT INTO publications(username, description, email, user_description) VALUES ('Juliana', 'Procura-se Empregada doméstica', 'juliana@example.com', 'Procuro alguém livre durante o dia.');";
    await db.execute(sql);

    sql =
        "INSERT INTO publications(username, description, phone, email, user_description) VALUES ('Julia', 'Carpinteiro', '(00) 90000-0000', 'julia@example.com', 'Tenho experiência de 15 anos como carpinteira, gosto de horários fixos e trabalhar sozinha.');";
    await db.execute(sql);

    sql =
        "INSERT INTO publications(username, description, phone, email, user_description) VALUES ('Jéssica', 'Empregada doméstica', '(00) 91111-1111', 'jessica@example.com', 'Tenho experiência de 20 anos como carpinteira, os preços das diárias variam de acordo com o tamanho da casa.');";
    await db.execute(sql);
  }

  @override
  Future<List<Map<String, Object?>>> findContractors() async {
    String sql = "SELECT * FROM users WHERE type=?;";
    final result = await _db.rawQuery(sql, ["contractors"]);
    return result;
  }

  @override
  Future<List<Map<String, Object?>>> findServiceProviders() async {
    String sql = "SELECT * FROM users WHERE type=?;";
    final result = await _db.rawQuery(sql, ["service provider"]);
    return result;
  }

  @override
  Future<bool> login(String email, String password) async {
    String sql =
        "SELECT email, password FROM users WHERE email=? AND password=?;";
    Database database = await db;
    final result = await database.rawQuery(sql, [email, password]);

    if (result.isNotEmpty) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> registerContractor(String type, String name, String email,
      String cpf, String password) async {
    String sql =
        "INSERT INTO users (type, name, email, cpf, password) VALUES (?, ?, ?, ?, ?);";
    final result = await _db.rawInsert(sql, [
      type,
      name,
      email,
      cpf,
      password,
    ]);

    if (result > 0) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> registerServiceProvider(String type, String name, String email,
      String cpf, String password, String phone, String specialty) async {
    String sql =
        "INSERT INTO users (type, name, email, cpf, password, phone, specialty) VALUES (? , ?, ?, ?, ?, ?, ?);";
    final result = await _db.rawInsert(sql, [
      type,
      name,
      email,
      cpf,
      password,
      phone,
      specialty,
    ]);

    if (result > 0) {
      return true;
    }

    return false;
  }

  @override
  Future<void> close() async {
    await _db.close();
  }
}
