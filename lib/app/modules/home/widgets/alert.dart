import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_controller.dart';

class AlertDia extends StatelessWidget {
  final int id;
  const AlertDia({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      title: Center(child: const Text('Notificaciones')),
      content: const Text(
          "¿Está seguro de eliminar esta nota? una vez eliminada no podrá recuperarla."),
      actions: [
        ElevatedButton(
            child: const Text("Aceptar"),
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.blue,
              primary: Colors.white,
            ),
            onPressed: () {
              Get.find<HomeController>().removeNote(id);
              Navigator.of(context).pop();
            }),
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
