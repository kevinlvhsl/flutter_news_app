import 'package:flutter/material.dart';
import 'package:flutter_news_app/common/entity/entitys.dart';
import 'package:flutter_news_app/common/utils/utils.dart';
import 'package:flutter_news_app/common/values/values.dart';

/// 分类导航
Widget newsCategoriesWidget(
    {List<CategoryResponseEntity> categories,
    String selectedCategoryCode,
    Function(CategoryResponseEntity) onTap}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories.map<Widget>((item) {
        return Container(
          alignment: Alignment.center,
          height: ukHeight(52),
          padding: EdgeInsets.symmetric(horizontal: ukWidth(8)),
          child: GestureDetector(
            child: Text(
              item.title,
              style: TextStyle(
                color: selectedCategoryCode == item.code
                    ? AppColors.secondaryElementText
                    : AppColors.primaryText,
                fontSize: ukFontSize(18),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => onTap(item),
          ),
        );
      }).toList(),
    ),
  );
}
