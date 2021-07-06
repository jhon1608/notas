import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_controller.dart';
//import 'package:notas/app/modules/home/widgets/item_favorites.dart';
import 'package:notas/app/modules/home/widgets/item_notes.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _.notes.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemNote(
              controller: _,
              note: _.notes[index],
            );
          },
        ),
      ),
    );
  }
}
