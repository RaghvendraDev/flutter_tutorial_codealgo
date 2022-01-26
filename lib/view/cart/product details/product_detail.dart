import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/cart_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/fav_counter_controller.dart';

import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/cart%20list/cart_list.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/product_details_body.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/favoriate%20list/favoriate_list.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  FavCounterController favCounterController = Get.find();

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    //initliasing quantity here so it become 1 after going back from details page
    cartController.initliaseQuantity();

    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(
        int.parse(product.color),
      ),
      appBar: buildAppBar(),
      body: ProductDetailsBody(
        product: product,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(
        int.parse(product.color),
      ),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => FavoriateList());
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: MyTheme.defaultPadding,
              right: MyTheme.defaultPadding,
            ),
            child: Badge(
              badgeContent: Obx(
                () => Text(
                  favCounterController.numOfItems.value.toString(),
                ),
              ),
              child: SvgPicture.asset(
                "assets/svg/heart.svg",
                width: 30,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => CartList());
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: MyTheme.defaultPadding,
              right: MyTheme.defaultPadding,
            ),
            child: Badge(
              // badgeColor: Colors.blue,
              badgeContent: Obx(
                () => Text(
                  cartController.totalQty.value.toString(),
                ),
              ),
              child: SvgPicture.asset("assets/svg/cart.svg"),
            ),
          ),
        ),
      ],
    );
  }
}
