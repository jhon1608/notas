import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/data/models/note.dart';
import 'package:notas/app/modules/home/home_controller.dart';

class AlertDia extends StatelessWidget {
  final int id;
  final Note note;
  final String menssage;
  final VoidCallback onAccept;
  const AlertDia(
      {Key? key,
      required this.id,
      required this.note,
      required this.menssage,
      required this.onAccept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      title: Center(child: const Text('Notificaciones')),
      content: Text(menssage),
      actions: [
        ElevatedButton(
          child: const Text("Aceptar"),
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.blue,
            primary: Colors.white,
          ),
          onPressed: onAccept,
        ),
        ElevatedButton(
          child: const Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.red,
            primary: Colors.white,
          ),
        ),
      ],
    );
  }
}
