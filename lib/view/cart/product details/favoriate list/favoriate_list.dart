import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/fav_counter_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/favoriate%20list/component/favoriate_list_background.dart';

class FavoriateList extends StatelessWidget {
  FavoriateList({Key? key}) : super(key: key);

  FavCounterController favCounterController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Favoriate List",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              "assets/svg/back.svg",
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: FavoriateListBackground(
          child: ListView.builder(
              itemCount: favCounterController.favList.length,
              itemBuilder: (context, index) {
                var currentItem = favCounterController.favList[index];
                return Card(
                  color: Color(
                    int.parse(currentItem.color),
                  ),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        currentItem.image,
                        height: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentItem.name,
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            currentItem.price.toString(),
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
