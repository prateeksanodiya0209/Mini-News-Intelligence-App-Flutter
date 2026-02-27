// news/domain/repositories/news_repository.dart
import '../../data/models/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> fetchNews(int page);
}