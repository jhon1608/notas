import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/data/providers/provider_notes.dart';
import 'package:get/get.dart';

class NoteRespository {
  final api = Get.find<ProvidersNote>();
  addNote(Note note) {
    api.addNote(note);
  }

  removeNote(int id) {
    api.removeNote(id);
  }

  Future<List<Note>> getAllNotes() {
    return api.getNotes();
  }

  updateNote(Note note) {
    return api.updateNote(note);
  }
}
