import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/product%20details/cart_controller.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/cart_counter.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class AddToCartPage extends StatelessWidget {
  AddToCartPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: MyTheme.defaultPadding),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              cartController.addItemInCart(product);
            },
            child: Container(
              margin: EdgeInsets.only(right: MyTheme.defaultPadding),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(
                  int.parse(product.color),
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(
                    int.parse(product.color),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/svg/cart.svg"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color(
                      int.parse(product.color),
                    ),
                  ),
                ),
                child: Text(
                  "Buy Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
