import 'package:get/get.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:notas/app/modules/home/widgets/alert.dart';
import 'package:notas/app/theme/theme.dart';

class ItemNote extends StatelessWidget {
  final HomeController controller;
  final Note note;
  const ItemNote({
    Key? key,
    required this.controller,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: AppTheme.instance.colorNote,
      child: Container(
        width: Get.width - 20,
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      controller.editNoteButton(note);
                    },
                    color: AppTheme.instance.colorIconEdit,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.star,
                    ),
                    onPressed: () {
                      controller.foavoriteNote(note);
                    },
                    color: (note.favorite == 1)
                        ? AppTheme.instance.colorIconEdit
                        : Colors.grey[400],
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDia(
                          id: note.id,
                          note: note,
                          onAccept: () {
                            Get.find<HomeController>().trashNote(note);
                            Navigator.of(context).pop();
                          },
                          menssage:
                              "¿Está seguro de pasar a la papelera esta nota?",
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppTheme.instance.colorIconRemove,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: AppTheme.instance.sizeTitle,
                    color: AppTheme.instance.colorText),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                note.description,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: AppTheme.instance.sizeText,
                    color: AppTheme.instance.colorText),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    note.createTimeFormat(),
                    style: TextStyle(color: AppTheme.instance.colorTextMin),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
