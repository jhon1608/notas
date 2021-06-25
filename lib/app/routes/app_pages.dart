import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_binding.dart';
import 'package:notas/app/modules/home/home_page.dart';
import 'package:notas/app/modules/new_note/new_note_binding.dart';
import 'package:notas/app/modules/new_note/new_note_page.dart';
import 'package:notas/app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.NEWNOTE,
      page: () => const NewNotePage(),
      binding: NewNoteBinding(),
    ),
  ];
}
