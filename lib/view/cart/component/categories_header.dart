import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welcome_loginsignup_dashboard/controller/cart%20controllers/category_controller.dart';
import 'package:welcome_loginsignup_dashboard/view/custom_widget/my_theme.dart';

class Categories extends StatelessWidget {
  CategoryController categoryController = Get.put(CategoryController());
  Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryController.categoryList.length,
        itemBuilder: (context, index) {
          return buildCategory(index, context);
        },
      ),
    );
  }

  Widget buildCategory(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        categoryController.changeIndex(index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryController.categoryList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: categoryController.currentIndex.value == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primaryVariant,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MyTheme.defaultPadding * 0.4),
                height: 2,
                width: 30,
                color: categoryController.currentIndex.value == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
