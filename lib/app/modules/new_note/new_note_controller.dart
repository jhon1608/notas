import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/data/repositories/note_respository.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class NewNoteController extends GetxController {
  String title = " ";
  String description = " ";
  final NoteRespository _noteRespository = Get.find<NoteRespository>();

  void onChangedTitle(String text) => title = text;

  void onChangedDescription(String text) => description = text;

  cancelButton() {
    Get.back();
  }

  submitButton() {
    Note note = Note(
        title: title, description: description, createTime: DateTime.now());
    _noteRespository.addNote(note);
    Get.find<HomeController>().load();
    Get.back();
  }
}
