import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/routes/app_routes.dart';

class BottonNavigationBarNote extends StatelessWidget {
  final int currentIndex;
  const BottonNavigationBarNote({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Get.offNamed(AppRoutes.HOME);
              },
            ),
            label: "Home",
            backgroundColor: Colors.red),
        BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: "Favoritos",
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.PAPELERA);
              },
              icon: Icon(
                Icons.delete_outline_outlined,
              ),
            ),
            label: "Papelera",
            backgroundColor: Colors.green)
      ],
    );
  }
}
