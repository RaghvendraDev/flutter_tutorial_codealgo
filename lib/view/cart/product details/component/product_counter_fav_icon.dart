import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/cart_controller.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/cart_counter.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ProductCounterWithFavIcon extends StatelessWidget {
  ProductCounterWithFavIcon({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MyTheme.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CartCounter(product: product),
          InkWell(
            onTap: () {
              print("liked click");
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                "assets/svg/heart.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
