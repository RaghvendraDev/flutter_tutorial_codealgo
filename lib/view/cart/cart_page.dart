import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/category_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/cart_page_background.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/categories_header.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class CartPage extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Product",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Categories(),
            ],
          ),
        ),
      ),
    );
  }
}
