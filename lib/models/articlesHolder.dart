import 'package:coolapp/models/article.dart';
import 'package:coolapp/services/api.dart';
import 'package:flutter/material.dart';

class ArticlesHolder extends ChangeNotifier {

  final List<Article> _articles = [];

  Api _api;

  ArticlesHolder() {
    this._api = new Api();
  }

  set articles(List<Article> news) {
    assert(news != null);

    _articles.clear();
    _articles.addAll(news);
    notifyListeners();
  }
  List<Article> get articles => this._articles;

  void refresh(context) => this._api.getArticles(context);
}