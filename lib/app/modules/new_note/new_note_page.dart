import 'package:notas/app/modules/new_note/new_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/theme/theme.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewNoteController>(
      builder: (_) => Container(
        child: Scaffold(
          backgroundColor: AppTheme.instance.colorNoteBackground,
          appBar: AppBar(
            backgroundColor: AppTheme.instance.colorAppBar,
            actions: [
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
            leading: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                _.submitButton();
              },
              color: AppTheme.instance.colorIconCheck,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                textDirection: TextDirection.ltr,
                children: [
                  Center(
                      child: Text(
                    "Ni nota",
                    style: TextStyle(color: AppTheme.instance.colorTextMin),
                  )),
                  TextFormField(
                    maxLength: 30,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                        fontSize: 30, color: AppTheme.instance.colorText),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppTheme.instance.colorText),
                      hintText: "Título",
                      border: InputBorder.none,
                    ),
                    onChanged: _.onChangedTitle,
                  ),
                  TextFormField(
                    onChanged: _.onChangedDescription,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppTheme.instance.colorText),
                      hintText: "Empieza a Escribir",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        fontSize: 20, color: AppTheme.instance.colorText),
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
