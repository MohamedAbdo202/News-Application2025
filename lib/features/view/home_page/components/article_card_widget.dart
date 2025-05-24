import 'package:flutter/material.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_cached_network_image.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/models/models/article_model.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/util/app_constants/app_colors.dart';
import 'package:news/util/routes/router.dart';
import 'package:news/util/routes/routes_name.dart';

class ArticleCardWidget extends StatelessWidget {
  const ArticleCardWidget({
    super.key,
    required this.item,
  });

  final Article item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.whiteColor,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: InkWell(
        onTap: () async {
          NewsCubit.get(context).singleItem.clear();
          NewsCubit.get(context).singleItem.add(item);
          AppRouter.pushNamed(
            Routes.articleDetailsPage,
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomCachedImage(
                  imageUrl: item.urlToImage,
                  width: 100,
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: item.title,
                        textStyle: Styles.blackColorStyle15.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: item.description.isNotEmpty ? 1 : 2,
                      ),
                      const SizedBox(height: 6),
                      CommonText(
                        text: item.description,
                        textStyle: Styles.blackColorStyle13.copyWith(
                          color: Colors.grey[700],
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range_rounded,
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          CommonText(
                            text: item.publishedAt.split('T')[0],
                            textStyle: Styles.blackColorStyle12.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
