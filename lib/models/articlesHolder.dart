// import 'package:coolapp/models/article.dart';
// import 'package:coolapp/services/api.dart';
// import 'package:flutter/material.dart';

// class ArticlesHolder extends ChangeNotifier {
//   final List<Article> _topNews = [];
//   final List<Article> _tecNews = [];

//   ArticlesHolder() {
//     Api().getArticles('technology').then((value) => topNews = value);
//   }

//   set topNews(List<Article> news) {
//     assert(news != null);

//     _topNews.clear();
//     _topNews.addAll(news);
//     notifyListeners();
//   }

//   set tecnologyNews(List<Article> news) {
//     assert(news != null);

//     _tecNews.clear();
//     _tecNews.addAll(news);
//     notifyListeners();
//   }

//   // deprecated
//   List<Article> get articles => [];

//   List<Article> get topNews => this._topNews;
//   List<Article> get tecnologyNews => this._tecNews;
// }
