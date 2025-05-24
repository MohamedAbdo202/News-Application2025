import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/app_bar/shared_app_bar.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/view/home_page/components/article_card_widget.dart';
import 'package:news/features/view/home_page/components/categories_widget.dart';
import 'package:news/features/view/home_page/components/home_header_text.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/features/viewmodels/news/news_states.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NewsCubit.get(context).fetchNewsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SharedAppBar(
        showLeading: false,
        title: 'News Application',
        showAction: true,
      ),
      body: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          final currentArticles = cubit.currentCategoryData;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(),

              /// Categories Widget
              CategoriesWidget(cubit: cubit),
              if (state is GetNewsLoading)
                const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state is GetNewsFailure)
                Expanded(
                  child: Center(
                      child: CommonText(
                    text: 'Error: ${state.errorMessage}',
                    textStyle: Styles.blackColorStyle13,
                  )),
                )
              else if (currentArticles.isEmpty)
                Expanded(
                  child: Center(
                      child: CommonText(
                    text: 'No articles available',
                    textStyle: Styles.blackColorStyle13,
                  )),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: currentArticles.length,
                    itemBuilder: (context, index) {
                      final item = currentArticles[index];

                      /// Article Details Widget
                      return ArticleCardWidget(item: item);
                    },
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
