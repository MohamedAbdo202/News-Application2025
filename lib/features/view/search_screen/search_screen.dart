import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/common/widgets/app_bar/shared_app_bar.dart';
import 'package:news/features/view/search_screen/components/search_field.dart';
import 'package:news/features/view/search_screen/components/search_result.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/features/viewmodels/news/news_states.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final cubit = NewsCubit.get(context);
    cubit.isSearch = false;
    cubit.searchData.clear();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchPressed(NewsCubit cubit) {
    final query = searchController.text.trim();
    if (query.isNotEmpty) {
      cubit.searchedData(query: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: const SharedAppBar(
            title: 'Search Page',
          ),
          body: Column(
            children: [
              /// Search Field
              SearchInputSection(
                controller: searchController,
                onSearch: () {
                  FocusScope.of(context).unfocus();
                  final query = searchController.text.trim();
                  if (query.isNotEmpty) {
                    cubit.searchedData(query: query);
                  }
                },
              ),

              ///Search Result
              const Expanded(child: SearchResultsList()),
            ],
          ),
        );
      },
    );
  }
}
