import 'package:flutter/material.dart';

import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/product_details_image_title_price.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: MyTheme.defaultPadding,
                    right: MyTheme.defaultPadding,
                  ),
                  // height: size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Color",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(
                                        top: MyTheme.defaultPadding * 0.5,
                                        left: MyTheme.defaultPadding * 0.5,
                                        right: MyTheme.defaultPadding * 0.5),
                                    padding: EdgeInsets.all(1.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ProductDetailsImageTitlePrice(product: product)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
