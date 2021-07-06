import 'package:notas/app/modules/edit_note/edit_note_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/modules/home/widgets/alert.dart';
import 'package:notas/app/theme/theme.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNoteController>(
      builder: (_) => Container(
        child: Scaffold(
          backgroundColor: AppTheme.instance.colorNoteBackground,
          appBar: AppBar(
            backgroundColor: AppTheme.instance.colorAppBar,
            actions: [
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  _.submitButton();
                },
                color: AppTheme.instance.colorIconCheck,
              ),
              Expanded(
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) => AlertDia(
                          id: _.note.id,
                          note: _.note,
                          onAccept: () {
                            Get.find<HomeController>().removeNote(_.note.id);
                            Get.back();
                            Get.back();
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
                ),
              ),
              IconButton(
                onPressed: () {
                  _.cancelButton();
                },
                icon: Icon(
                  Icons.cancel_rounded,
                  color: AppTheme.instance.colorIconRemove,
                ),
              )
            ],
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                textDirection: TextDirection.ltr,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(child: SizedBox()),
                      Expanded(child: SizedBox()),
                      Text(
                        "Mi nota",
                        style: TextStyle(color: AppTheme.instance.colorTextMin),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        _.note.createTimeFormat2(),
                        style: TextStyle(color: AppTheme.instance.colorTextMin),
                      ),
                    ],
                  ),
                  TextFormField(
                    maxLength: 30,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                        fontSize: AppTheme.instance.sizeTitle,
                        color: AppTheme.instance.colorText),
                    decoration: InputDecoration(
                      hintText: "Título",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: AppTheme.instance.colorText),
                    ),
                    onChanged: _.onChangedTitle,
                    initialValue: _.title,
                  ),
                  TextFormField(
                    onChanged: _.onChangedDescription,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Empieza a Escribir",
                      hintStyle: TextStyle(color: AppTheme.instance.colorText),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: AppTheme.instance.sizeText,
                        color: AppTheme.instance.colorText),
                    initialValue: _.description,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
