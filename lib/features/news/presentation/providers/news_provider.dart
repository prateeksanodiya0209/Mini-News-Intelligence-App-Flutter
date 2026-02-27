// news/presentation/providers/news_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/article_model.dart';
import '../../data/datasources/news_remote_ds.dart';

final newsProvider =
StateNotifierProvider<NewsNotifier, AsyncValue<List<ArticleModel>>>(
      (ref) => NewsNotifier(),
);

class NewsNotifier extends StateNotifier<AsyncValue<List<ArticleModel>>> {
  NewsNotifier() : super(const AsyncLoading()) {
    loadNews();
  }

  final _remote = NewsRemoteDataSource();

  int _page = 1;
  String _category = 'business';
  String _searchQuery = '';
  bool _isSearching = false;
  String get currentCategory => _category;

  Future<void> loadNews({bool refresh = false}) async {
    if (refresh) _page = 1;

    try {
      final articles = _isSearching
          ? await _remote.searchArticles(
        query: _searchQuery,
        page: _page,
      )
          : await _remote.fetchByCategory(
        category: _category,
        page: _page,
      );

      state = AsyncData(
        refresh ? articles : [...state.value ?? [], ...articles],
      );

      _page++;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void changeCategory(String category) {
    _category = category;
    _isSearching = false;
    state = const AsyncLoading();
    loadNews(refresh: true);
  }

  void search(String query) {
    _searchQuery = query;
    _isSearching = query.isNotEmpty;
    state = const AsyncLoading();
    loadNews(refresh: true);
  }
}