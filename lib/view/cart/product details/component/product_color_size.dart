import 'package:flutter/material.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/cart/product%20details/component/product_details_color.dart';

class ProductColorSize extends StatelessWidget {
  const ProductColorSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
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
                    ProductDetailColorDot(
                      color: Color(
                        int.parse(product.color),
                      ),
                      isSelected: true,
                    ),
                    const ProductDetailColorDot(
                      color: Colors.orange,
                    ),
                    const ProductDetailColorDot(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Size\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: "${product.size} CM",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
