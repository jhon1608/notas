import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(5),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: note.description.length > 100
            ? Colors.yellow[100]
            : Colors.yellow[100],
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  // style: ElevatedButton.styleFrom(
                  //   onPrimary: Colors.amber,
                  //   primary: Colors.amber[50],
                  // ),
                  color: Colors.amberAccent,
                  highlightColor: Colors.amber[100],

                  splashColor: Colors.yellow,
                ),
                trailing: IconButton(
                  onPressed: () {
                    controller.removeNote(note.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[400],
                  ),
                  splashColor: Colors.red,
                  highlightColor: Colors.red[100],
                ),
                title: Center(
                  child: Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  note.description,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    note.createTimeFormat(),
                    style: TextStyle(color: Colors.black54),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
