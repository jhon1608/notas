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

  Future<List<Note>> getAllNotes() async {
    List<Note> notas = await api.getNotes();
    notas.sort((a, b) => b.createTime.compareTo(a.createTime));

    return notas;
  }

  Future<List<Note>> getNotes() async {
    List<Note> notas = await getAllNotes();

    List<Note> n = [];
    for (var item in notas) {
      if (item.trash == 0) {
        n.add(item);
      }
    }

    return n;
  }

  Future<List<Note>> getFavorites() async {
    List<Note> notas = await getAllNotes();
    List<Note> favorites = [];
    for (var item in notas) {
      if (item.favorite == 1) {
        print(item.title);
        favorites.add(item);
      }
    }

    return favorites;
  }

  Future<List<Note>> getTrash() async {
    List<Note> notas = await getAllNotes();
    List<Note> trash = [];
    for (var item in notas) {
      if (item.trash == 1) {
        print(item.title);
        trash.add(item);
      }
    }
    return trash;
  }

  updateNote(Note note) {
    return api.updateNote(note);
  }
}
