import 'package:news/core/constants/exception_enums.dart';
import 'package:news/core/error/exceptions/server_exceptions/custom_exceptions.dart';
import 'package:news/features/models/get_news_repository/get_news.dart';
import 'package:news/features/models/models/article_model.dart';
import 'package:news/util/network/api_url.dart';
import 'package:news/util/network/network_api.dart';

class GetNewsApi extends GetNews {
  ///API Call To Get The Data based on The Category

  @override
  Future<List<Article>> getNews({String? category}) async {
    try {
      final response = await DioHelper.getData(queryParameters: {
        'country': 'us',
        'category': category,
        'apiKey': ApiUrl.apiKey,
      }, url: ApiUrl.newsUrl);
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final articlesJson = responseData['articles'] as List<dynamic>;

        final articles =
            articlesJson.map((json) => Article.fromJson(json)).toList();

        return articles;
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          'error.png',
          errorMassage: 'Unknown error',
        );
      }
    } on CustomException {
      rethrow;
    }
  }

  @override
  Future<List<Article>> getSearchedNews({required String query}) async {
    try {
      final response = await DioHelper.getData(queryParameters: {
        'q': query,
        'apiKey': ApiUrl.apiKey,
      }, url: ApiUrl.newsUrl);
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final articlesJson = responseData['articles'] as List<dynamic>;

        final articles =
            articlesJson.map((json) => Article.fromJson(json)).toList();

        return articles;
      } else {
        throw CustomException(
          CustomStatusCodeErrorType.unExcepted,
          'error.png',
          errorMassage: 'Unknown error',
        );
      }
    } on CustomException {
      rethrow;
    }
  }
}
