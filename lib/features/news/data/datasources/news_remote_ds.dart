// news/data/datasources/news_remote_ds.dart
import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../models/article_model.dart';

class NewsRemoteDataSource {
  final Dio _dio = DioClient.dio;

  Future<List<ArticleModel>> fetchByCategory({
    required String category,
    required int page,
  }) async {
    final response = await _dio.get(
      '/top-headlines',
      queryParameters: {
        'country': 'us',
        'category': category,
        'page': page,
        'pageSize': 10,
      },
    );

    return (response.data['articles'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();
  }

  Future<List<ArticleModel>> searchArticles({
    required String query,
    required int page,
  }) async {
    final response = await _dio.get(
      '/everything',
      queryParameters: {
        'q': query,
        'page': page,
        'pageSize': 10,
        'sortBy': 'publishedAt',
      },
    );

    return (response.data['articles'] as List)
        .map((e) => ArticleModel.fromJson(e))
        .toList();
  }
}