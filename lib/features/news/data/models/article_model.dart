// news/data/models/article_model.dart
import 'package:hive/hive.dart';

part 'article_model.g.dart';

@HiveType(typeId: 1)
class ArticleModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String url;

  @HiveField(3)
  final String imageUrl;

  ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}