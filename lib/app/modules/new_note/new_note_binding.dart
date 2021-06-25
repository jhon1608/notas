import 'package:get/get.dart';
import 'package:notas/app/modules/new_note/new_note_controller.dart';

class NewNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NewNoteController(),
    );
  }
}
