import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas_3/Tugas_12/db/models/user_login_model.dart';
import 'package:flutter/foundation.dart';

class DBHelper {
  // Singleton pattern
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  // Getter untuk mendapatkan database instans
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Fungsi inisialisasi database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ppkd.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            password TEXT, 
            name TEXT NOT NULL,
            phone TEXT NOT NULL,
        city TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            "ALTER TABLE users ADD COLUMN name TEXT NOT NULL DEFAULT ''",
          );
          await db.execute(
            "ALTER TABLE users ADD COLUMN phone TEXT NOT NULL DEFAULT ''",
          );
          await db.execute(
            "ALTER TABLE users ADD COLUMN city TEXT NOT NULL DEFAULT ''",
          );
        }
      },
    );
  }

  Future<bool> registerUser(UserModelSQL pengguna) async {
    final db = await database;

    try {
      await db.insert('users', pengguna.toMap());
      return true;
    } catch (e) {
      debugPrint('registerUser error: $e');
      return false;
    }
  }

  Future<UserModelSQL?> loginUser(String email, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserModelSQL.fromMap(results.first);
    }
    return null;
  }

  Future<List<UserModelSQL>> getAllUsers() async {
    final db = await database;
    // Query tanpa 'where' akan mengambil seluruh record di tabel
    final List<Map<String, dynamic>> results = await db.query('users');
    // Konversi setiap Map hasil query menjadi objek UserModelsSQL menggunakan fromMap()
    return results.map((map) => UserModelSQL.fromMap(map)).toList();
  }

  // ===== TAMBAHAN Menu Delete =====
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // ===== TAMBAHAN Update =====
  Future<bool> updateUser(UserModelSQL pengguna) async {
    final db = await database;
    try {
      final count = await db.update(
        'users',
        pengguna.toMap(),
        where: 'id = ?',
        whereArgs: [pengguna.id],
      );
      return count > 0;
    } catch (e) {
      debugPrint('updateUser error: $e');
      return false;
    }
  }
}
