import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/modules/home/widgets/item_notes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static Color? color = Colors.amber[800];
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.amber[800],
          title: const Center(
              child: const Text(
            "NOTAS",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            _.newNoteButton();
          },
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.amber[800],
            shadowColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          icon: Icon(
            Icons.add,
            size: 30,
          ),
          label: Text("Nuevo"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: _.notes.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemNote(
                controller: _,
                note: _.notes[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
