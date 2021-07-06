import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/modules/home/widgets/home.dart';
import 'package:notas/app/modules/home/widgets/item_notes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/widgets/item_trash.dart';
import 'package:notas/app/modules/home/widgets/trash.dart';
import 'package:notas/app/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _.currentIndex,
          onTap: _.currentIndexChange,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              label: "Favoritos",
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.delete_outline_outlined,
              ),
              label: "Papelera",
              backgroundColor: Colors.green,
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 1,
          backgroundColor: AppTheme.instance.colorAppBar,
          title: Center(
              child: Text(
            "NOTAS",
            style: TextStyle(
              color: AppTheme.instance.colorText,
            ),
          )),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            _.newNoteButton();
          },
          style: ElevatedButton.styleFrom(
            onPrimary: AppTheme.instance.colorButtonText,
            primary: AppTheme.instance.colorButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            textStyle: TextStyle(fontSize: AppTheme.instance.sizeTitle),
          ),
          icon: Icon(
            Icons.add,
            size: AppTheme.instance.sizePrimaryTitle,
          ),
          label: Text("Nuevo"),
        ),
        body: _.currentIndexMap[_.currentIndex],
      ),
    );
  }
}
