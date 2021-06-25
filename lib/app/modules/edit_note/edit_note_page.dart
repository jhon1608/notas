import 'package:notas/app/modules/edit_note/edit_note_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNoteController>(
      builder: (_) => Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {
                  _.cancelButton();
                },
                icon: Icon(
                  Icons.cancel_rounded,
                  color: Colors.red,
                ),
              )
            ],
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                _.submitButton();
              },
              color: Colors.green,
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
                    style: const TextStyle(color: Colors.black38),
                  )),
                  TextFormField(
                    maxLength: 30,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "Título",
                      border: InputBorder.none,
                    ),
                    onChanged: _.onChangedTitle,
                    initialValue: _.title,
                  ),
                  TextFormField(
                    onChanged: _.onChangedDescription,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Empieza a Escribir",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 20),
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
