import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/modules/home/widgets/item_trash.dart';

import 'item_notes.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (_) => Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _.notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemTrash(controller: _, note: _.notes[index]);
                },
              ),
            ));
  }
}
