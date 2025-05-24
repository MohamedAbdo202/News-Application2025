import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/app_bar/shared_app_bar.dart';
import 'package:news/common/widgets/common_cached_network_image.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/view/article_details/components/url_widget.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var item = NewsCubit.get(context).singleItem[0];
    return Scaffold(
      appBar: SharedAppBar(
        title: NewsCubit.get(context).selectedCategory,
        showLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            /// Handle Image View of The Article
            if (item.urlToImage.isNotEmpty)
              CustomCachedImage(
                imageUrl: item.urlToImage,
                height: 200,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
              )
            else
              Container(
                height: 200,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            const SizedBox(height: 16),
            CommonText(text: item.title, textStyle: Styles.blackColorStyle17),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(
                Icons.calendar_month_rounded,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 5,
              ),
              CommonText(
                  text: item.publishedAt.split('T')[0],
                  textStyle:
                      Styles.blackColorStyle13.copyWith(color: Colors.grey)),
            ]),
            const SizedBox(height: 15),
            CommonText(
                text: item.description, textStyle: Styles.blackColorStyle15),
            const SizedBox(height: 12),
            if (item.content.isNotEmpty) ...[
              CommonText(
                  text: 'Content : ', textStyle: Styles.blackColorStyle17),
              const SizedBox(height: 7),
              CommonText(
                text: item.content,
                textStyle:
                    Styles.blackColorStyle13.copyWith(color: Colors.grey),
              ),
            ],
            SizedBox(height: 15.h),

            /// Open URL Widget Launcher
            UrlButtonWidget(item: item),
          ],
        ),
      ),
    );
  }
}
