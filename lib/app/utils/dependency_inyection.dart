import 'package:get/get.dart';
import 'package:notas/app/data/providers/provider_notes.dart';
import 'package:notas/app/data/repositories/note_respository.dart';

class DependencyInjection {
  static void init() {
    //providers
    Get.put<ProvidersNote>(ProvidersNote());
    //repositories
    Get.put<NoteRespository>(NoteRespository());
  }
}
