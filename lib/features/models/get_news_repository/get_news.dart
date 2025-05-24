import 'package:news/features/models/models/article_model.dart';

abstract class GetNews {
  Future<List<Article>> getNews({String category});
  Future<List<Article>> getSearchedNews({required String query});
}
