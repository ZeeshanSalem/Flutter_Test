import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/typography.dart';
import 'package:test_app/feature/home/data/model/category_model.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.categoryModel}) : super(key: key);
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: CustomColors.gray,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            categoryModel.iconData,
            size: 20,
            color: CustomColors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          '${categoryModel.name}',
          style: CustomTypography.subTitleStyle.copyWith(
            color: CustomColors.gray,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
