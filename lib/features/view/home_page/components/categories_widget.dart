import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/util/app_constants/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.cubit,
  });

  final NewsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 7.h, bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: cubit.categories.map((category) {
          final isSelected = cubit.selectedCategory == category;
          return GestureDetector(
            onTap: () {
              cubit.selectedCategory = category;
              cubit.fetchNewsData();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.blueColor : AppColors.grayColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CommonText(
                    text: category,
                    textStyle: isSelected
                        ? Styles.whiteColorStyle13
                        : Styles.blackColorStyle13)),
          );
        }).toList(),
      ),
    );
  }
}
