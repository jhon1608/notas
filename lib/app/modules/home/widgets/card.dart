import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/theme/theme.dart';

class CardNote extends StatelessWidget {
  final Note note;
  final HomeController controller;
  const CardNote({Key? key, required this.note, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        color: AppTheme.instance.colorNote,
        child: MaterialButton(
          onPressed: () {
            controller.editNoteButton(note);
          },
          child: Container(
            padding: EdgeInsets.only(top: 2.0),
            width: 150,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: AppTheme.instance.sizeTitle),
                  ),
                ),
                Text(
                  note.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  note.createTimeFormat(),
                  style: TextStyle(color: AppTheme.instance.colorTextMin),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
