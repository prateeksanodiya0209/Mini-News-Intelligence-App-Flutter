// favorites/favorite_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../news/data/models/article_model.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<ArticleModel>>(
      (_) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<List<ArticleModel>> {
  FavoriteNotifier() : super([]);

  void addFavorite(ArticleModel article) {
    state = [...state, article];
  }
}