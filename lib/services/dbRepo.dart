import 'package:coolapp/main.dart';
import 'package:coolapp/models/article.dart';
import 'package:hive/hive.dart';

class DbRepository {
  Box<Article> favoriteNews = Hive.box(NewsBox);

  addArticle(Article art) => favoriteNews.put(art.id, art);

  List<Article> getArticles() => favoriteNews.values.toList();

  watch() => favoriteNews.watch();
}
