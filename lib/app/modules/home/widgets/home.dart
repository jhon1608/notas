import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notas/app/modules/home/home_controller.dart';
import 'package:notas/app/modules/home/widgets/card.dart';
import 'package:notas/app/modules/home/widgets/item_notes.dart';
import 'package:notas/app/theme/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Favoritos",
              style: TextStyle(fontSize: AppTheme.instance.sizePrimaryTitle),
            ),
            Container(
              width: Get.width,
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: _.favorites.length,
                        itemBuilder: (context, index) => CardNote(
                          controller: _,
                          note: _.favorites[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Home",
              style: TextStyle(fontSize: AppTheme.instance.sizePrimaryTitle),
            ),
            Container(
              //height: Get.height * 0.54,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: _.notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemNote(
                          controller: _,
                          note: _.notes[index],
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
