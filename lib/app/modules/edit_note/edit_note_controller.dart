import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/data/repositories/note_respository.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class EditNoteController extends GetxController {
  String title = " ";
  String description = " ";
  Note note = Get.arguments;

  final NoteRespository _noteRespository = Get.find<NoteRespository>();

  void onChangedTitle(String text) => title = text;

  void onChangedDescription(String text) => description = text;

  @override
  void onInit() {
    title = note.title;
    description = note.description;
    update();
  }

  cancelButton() {
    Get.back();
  }

  submitButton() {
    // Note note = Note(
    //     title: title, description: description, createTime: DateTime.now());
    // _noteRespository.addNote(note);
    // Get.find<HomeController>().load();
    Note copy = note.copy(description: description, title: title);
    _noteRespository.updateNote(copy);
    Get.find<HomeController>().load();
    Get.back();
  }
}
