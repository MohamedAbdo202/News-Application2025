import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/common/styles/app_style.dart';
import 'package:news/common/widgets/common_text.dart';
import 'package:news/features/view/home_page/components/article_card_widget.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/features/viewmodels/news/news_states.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = NewsCubit.get(context);

        if (state is GetNewsSearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetNewsSearchEmpty && cubit.isSearch == true) {
          return Center(
            child: CommonText(
              text: 'No articles available',
              textStyle: Styles.blackColorStyle15,
            ),
          );
        } else if (state is GetNewsSearchSuccess) {
          return ListView.builder(
            itemCount: cubit.searchData.length,
            itemBuilder: (context, index) {
              final item = cubit.searchData[index];
              return ArticleCardWidget(item: item);
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
