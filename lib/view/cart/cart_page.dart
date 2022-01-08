import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/category_controller.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product_controller.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/cart_page_background.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/categories_header.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/item_card.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/component/product_detail.dart';
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
              Obx(
                () => productController.isDataLoadingCompleetd.value == true
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MyTheme.defaultPadding,
                            horizontal: MyTheme.defaultPadding,
                          ),
                          child: GridView.builder(
                            itemCount: productController.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              mainAxisSpacing: MyTheme.defaultPadding,
                              crossAxisSpacing: MyTheme.defaultPadding,
                            ),
                            itemBuilder: (context, index) {
                              var currentProduct =
                                  productController.products[index];
                              return ItemCard(
                                currentProduct: currentProduct,
                                cardClickHandler: () {
                                  Get.to(
                                    () => ProductDetailPage(
                                      product: currentProduct,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      )
                    : CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
