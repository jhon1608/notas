import 'package:get/get.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:notas/app/modules/home/widgets/alert.dart';
import 'package:notas/app/theme/theme.dart';

class ItemTrash extends StatelessWidget {
  final HomeController controller;
  final Note note;
  const ItemTrash({
    Key? key,
    required this.controller,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: AppTheme.instance.colorNote,
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDia(
                        id: note.id,
                        note: note,
                        onAccept: () {
                          Get.find<HomeController>().removeNote(note.id);
                          Navigator.of(context).pop();
                        },
                        menssage:
                            "¿Está seguro de eliminar definitivamente esta nota? una vez eliminada no podrá recuperarla.",
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: AppTheme.instance.colorIconRemove,
                  ),
                ),
                title: Text(
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
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    note.createTimeFormat(),
                    style: TextStyle(color: AppTheme.instance.colorTextMin),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
