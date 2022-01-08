import 'package:flutter/material.dart';

import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(product.name),
      ),
    );
  }
}
