import 'package:get/get.dart';
import 'package:notas/app/modules/edit_note/edit_note_controller.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditNoteController(),
    );
  }
}
