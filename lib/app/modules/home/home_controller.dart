import 'package:notas/app/data/dataBase/db.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/data/repositories/note_respository.dart';
import 'package:notas/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final NoteRespository _noteRespository = Get.find<NoteRespository>();
  List<Note> notes = [];
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
      notes = await DataBaseNote.notes();
      update();
    } catch (e) {
      print(e);
    }
  }

  removeNote(int id) {
    _noteRespository.removeNote(id);
    load();
    update();
  }

  void newNoteButton() {
    Get.toNamed(AppRoutes.NEWNOTE);
  }

  void editNoteButton(Note note) {
    Get.toNamed(AppRoutes.EDITNOTE, arguments: note);
  }
}
