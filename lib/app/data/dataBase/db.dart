import 'package:notas/app/data/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseNote {
  static const String nameDb = "notas";
  static Future<Database> openDb() async {
    return openDatabase(
      join(
        await getDatabasesPath(),
        '$nameDb.db',
      ),
      onCreate: (db, version) {
        // Ejecuta la sentencia CREATE TABLE en la base de datos
        return db.execute(
          "CREATE TABLE $nameDb(id INTEGER PRIMARY KEY, title TEXT, description TEXT, createTime TEXT)",
        );
      },
      // Establece la versión. Esto ejecuta la función onCreate y proporciona una
      // ruta para realizar actualizacones y defradaciones en la base de datos.
      version: 1,
    );
  }

  static Future<List<Note>> notes() async {
    // Obtiene una referencia de la base de datos
    final Database db = await openDb();

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query(nameDb);

    // Convierte List<Map<String, dynamic> en List<Dog>.
    print(maps.length);
    return List.generate(maps.length, (i) {
      return Note(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          createTime: DateTime.parse(maps[i]['createTime']));
    });
  }

  static Future<int?> insertNote(Note note) async {
    Database db = await openDb();

    // db.execute("DELETE FROM nameDb");
    print("se elimino");

    try {
      Map<String, dynamic> map = {
        //'id': note.id,
        'title': note.title,
        'description': note.description,
        'createTime': note.createTime.toString()
      };
      return db.insert(nameDb, map);
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> removeNote(int id) async {
    Database db = await openDb();
    // db.execute("DELETE FROM nameDb");
    try {
      return db.delete(nameDb, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }

  static Future<void> updateNote(Note note) async {
    // Get a reference to the database.
    Database db = await openDb();
    // Update the given Note.
    await db.update(
      '$nameDb',
      note.toMap(),
      // Ensure that the Note has a matching id.
      where: 'id = ?',
      // Pass the Note's id as a whereArg to prevent SQL injection.
      whereArgs: [note.id],
    );
  }
}
