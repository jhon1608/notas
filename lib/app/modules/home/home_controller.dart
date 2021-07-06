import 'package:flutter/cupertino.dart';
import 'package:notas/app/data/dataBase/db.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/data/repositories/note_respository.dart';
import 'package:notas/app/modules/home/widgets/favorites.dart';
import 'package:notas/app/modules/home/widgets/home.dart';
import 'package:notas/app/modules/home/widgets/item_notes.dart';
import 'package:notas/app/modules/home/widgets/trash.dart';
import 'package:notas/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final NoteRespository _noteRespository = Get.find<NoteRespository>();
  int currentIndex = 0;
  Map<int, Widget> currentIndexMap = {
    0: Home(),
    1: Favorites(),
    2: Trash(),
  };

  List<Note> notes = [];
  List<Note> allNotes = [];
  List<Note> favorites = [];
  List<Note> trash = [];

  currentIndexChange(int id) {
    print(id);
    currentIndex = id;
    load();
    update();
  }

  @override
  void onInit() {
    load();

    print("cargando notas");
    super.onInit();
  }

  @override
  void onReady() {}

  Future<void> load() async {
    try {
      print("en el ya tu save");
      favorites = await _noteRespository.getFavorites();
      update();
      if (currentIndex == 0) {
        notes = await _noteRespository.getNotes();
        update();
      }
      if (currentIndex == 1) {
        notes = await _noteRespository.getFavorites();

        update();
      }
      if (currentIndex == 2) {
        notes = await _noteRespository.getTrash();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  removeNote(int id) {
    _noteRespository.removeNote(id);
    load();
    update();
  }

  trashNote(Note note) {
    Note copy = note.copy(trash: 1);
    _noteRespository.updateNote(copy);
    load();
  }

  foavoriteNote(Note note) {
    Note copy = note.copy(favorite: (note.favorite == 0) ? 1 : 0);
    _noteRespository.updateNote(copy);
    load();
  }

  getTrash() async {
    this.trash = await _noteRespository.getTrash();
    trash.map((e) => print(e.title));
    load();
  }

  void newNoteButton() {
    Get.toNamed(AppRoutes.NEWNOTE);
  }

  void editNoteButton(Note note) {
    Get.toNamed(AppRoutes.EDITNOTE, arguments: note);
  }
}
