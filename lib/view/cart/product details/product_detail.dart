import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/product_details_body.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        Padding(
          padding: EdgeInsets.only(
            left: MyTheme.defaultPadding,
            right: MyTheme.defaultPadding,
          ),
          child: Badge(
            badgeContent: Text("0"),
            child: SvgPicture.asset(
              "assets/svg/heart.svg",
              width: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: MyTheme.defaultPadding,
            right: MyTheme.defaultPadding,
          ),
          child: Badge(
            // badgeColor: Colors.blue,
            badgeContent: Text("0"),
            child: SvgPicture.asset("assets/svg/cart.svg"),
          ),
        ),
      ],
    );
  }
}
