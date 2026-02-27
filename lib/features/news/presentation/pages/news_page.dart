// news/presentation/pages/news_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/auth_provider.dart';
import '../providers/news_provider.dart';
import '../widgets/category_tabs.dart';
import 'article_detail_page.dart';

class NewsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(newsProvider);
    final notifier = ref.read(newsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Intelligence'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CategoryTabs(
            onTap: (cat) =>
                ref.read(newsProvider.notifier).changeCategory(cat), selectedCategory:  notifier.currentCategory,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () =>
                ref.read(authProvider.notifier).logout(),
          )
        ],
      ),
      body: Column(
        children: [
          //  SEARCH
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search news...',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (q) =>
                  ref.read(newsProvider.notifier).search(q),
            ),
          ),

          //  LIST
          Expanded(
            child: state.when(
              loading: () =>
              const Center(child: CircularProgressIndicator()),
              error: (e, _) =>
              const Center(child: Text('Something went wrong')),
              data: (articles) => RefreshIndicator(
                onRefresh: () =>
                    ref.read(newsProvider.notifier).loadNews(refresh: true),
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (_, i) {
                    final article = articles[i];
                    return ListTile(
                      title: Text(article.title),
                      subtitle: Text(article.description),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ArticleDetailPage(article: article),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      //  PAGINATION
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.more_horiz),
        onPressed: () =>
            ref.read(newsProvider.notifier).loadNews(),
      ),
    );
  }
}