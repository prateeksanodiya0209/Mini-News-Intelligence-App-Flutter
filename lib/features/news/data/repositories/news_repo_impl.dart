import '../../data/models/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> getByCategory({
    required String category,
    required int page,
  });

  Future<List<ArticleModel>> search({
    required String query,
    required int page,
  });
}