import 'package:flutter/material.dart';
import 'package:welcome_loginsignup_dashboard/model/cart%20model/product_model.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.currentProduct,
    required this.cardClickHandler,
  }) : super(key: key);

  final ProductModel currentProduct;
  final Function cardClickHandler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        cardClickHandler();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // width: size.width * 0.4,
            // height: size.height * 0.2,
            padding: EdgeInsets.all(MyTheme.defaultPadding),
            decoration: BoxDecoration(
              color: Color(
                int.parse(currentProduct.color),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(currentProduct.image),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: MyTheme.defaultPadding * 0.5),
            child: Text(currentProduct.name),
          ),
          Text(
            "₹ ${currentProduct.price.toString()}",
          ),
        ],
      ),
    );
  }
}
