import 'package:flutter/material.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class ProductDetailColorDot extends StatelessWidget {
  const ProductDetailColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
