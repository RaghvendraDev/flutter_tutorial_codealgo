import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/cart_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/cart%20list/component/cart_list_background.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartListBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MyTheme.defaultPadding,
                  vertical: MyTheme.defaultPadding,
                ),
                child: Obx(
                  () => ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        var currentItem = cartController.cartItems[index];
                        return Card(
                          clipBehavior: Clip.none,
                          color: Color(int.parse(currentItem.product.color)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                currentItem.product.image,
                                width: 100,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Quantity: ${currentItem.qty}"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cartController
                                          .removeThisItemFromList(currentItem);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MyTheme.defaultPadding, right: MyTheme.defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Obx(() => Text(
                            "Total Amount:\n ${cartController.totalAmount.value.toString()}",
                            style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => Text(
                            "Total Quantity:\n ${cartController.totalQty.value.toString()}",
                            style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Item List",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
