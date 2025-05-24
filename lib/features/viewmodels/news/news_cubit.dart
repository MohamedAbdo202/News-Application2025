import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/models/get_news_repository/get_news.dart';
import 'package:news/features/models/models/article_model.dart';

import 'news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  final GetNews getNewsData;

  NewsCubit({required this.getNewsData}) : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  List<Article> singleItem = [];
  List<Article> businessData = [];
  List<Article> sportData = [];
  List<Article> scienceData = [];
  List<Article> technologyData = [];
  List<Article> searchData = [];

  final List<String> categories = [
    'Business',
    'Sports',
    'Science',
    'Technology'
  ];
  String selectedCategory = 'Business';

  /// Switch case Between Categories
  List<Article> get currentCategoryData {
    switch (selectedCategory) {
      case 'Sports':
        return sportData;
      case 'Science':
        return scienceData;
      case 'Technology':
        return technologyData;
      default:
        return businessData;
    }
  }

  /// Fetch Data From the Data layer Based On Category
  Future<void> fetchNewsData() async {
    emit(GetNewsLoading());

    try {
      switch (selectedCategory) {
        case 'Sports':
          sportData = await getNewsData.getNews(category: selectedCategory);
          break;
        case 'Science':
          scienceData = await getNewsData.getNews(category: selectedCategory);

          break;
        case 'Technology':
          technologyData =
              await getNewsData.getNews(category: selectedCategory);

          break;
        default:
          businessData = await getNewsData.getNews(category: selectedCategory);
      }

      emit(GetNewsSuccess());
    } catch (error) {
      emit(GetNewsFailure(errorMessage: error.toString()));
    }
  }

  bool isSearch = false;

  /// Fetch data based on the searched query
  Future<void> searchedData({required String query}) async {
    emit(GetNewsSearchLoading());
    isSearch = false;
    try {
      searchData = await getNewsData.getSearchedNews(query: query);

      if (searchData.isEmpty) {
        isSearch = true;
        emit(GetNewsSearchEmpty());
      } else {
        emit(GetNewsSearchSuccess());
      }
    } catch (error) {
      emit(GetNewsSearchFailure(errorMessage: error.toString()));
    }
  }
}
