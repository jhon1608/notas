import 'package:notas/app/data/dataBase/db.dart';
import 'package:notas/app/data/models/note.dart';

class ProvidersNote {
  Future<List<Note>> getNotes() async => DataBaseNote.notes();
  Future<int?> addNote(Note note) => DataBaseNote.insertNote(note);
  removeNote(int id) => DataBaseNote.removeNote(id);
}
