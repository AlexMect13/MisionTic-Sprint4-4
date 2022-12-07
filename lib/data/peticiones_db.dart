import 'package:sqflite/sqflite.dart' as sql;

class PeticionesDB {
  static Future<void> createTabla(sql.Database db) async {
    await db.execute(""" CREATE TABLE Ubicacion(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    detalle TEXT,
    Longitude TEXT,
    Latitude TEXT,
    Precitions TEXT,
    Times TEXT)       
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('retoN4', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTabla(database);
    });
  }

  static Future<void> adicionar(detalle, Longitude, Latitude, precition) async {
    final db = await PeticionesDB.db();
    final datos = {
      "detalle": detalle,
      "Longitude": Longitude,
      "Latitude": Latitude,
      "Precitions": precition,
      "Times": DateTime.now().toString()
    };
    await db.insert("Ubicacion", datos,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> listpunts() async {
    final db = await PeticionesDB.db();
    return db.query("Ubicacion", orderBy: "detalle");
  }

  static Future<void> eliminar(int id) async {
    final db = await PeticionesDB.db();
    await db.delete("Ubicacion", where: "id= ?", whereArgs: [id]);
  }

  static Future<void> deleteall() async {
    final db = await PeticionesDB.db();
    await db.delete('Ubicacion');
  }
}
