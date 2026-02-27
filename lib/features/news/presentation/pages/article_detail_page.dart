// news/presentation/pages/article_detail_page.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../data/models/article_model.dart';

class ArticleDetailPage extends StatefulWidget {
  final ArticleModel article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late Box<ArticleModel> box;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    box = Hive.box<ArticleModel>('favorites');
    isFavorite = box.values.any((e) => e.url == widget.article.url);
  }

  void toggleFavorite() {
    if (isFavorite) {
      final key = box.keys.firstWhere(
            (k) => box.get(k)!.url == widget.article.url,
      );
      box.delete(key);
    } else {
      box.add(widget.article);
    }

    setState(() => isFavorite = !isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: toggleFavorite,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.article.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(widget.article.description),
              const SizedBox(height: 24),
              Text(
                widget.article.url,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}