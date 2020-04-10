// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:coolapp/models/article.dart';
// import 'package:http/http.dart' as http;

// const String API = 'http://newsapi.org/v2/';
// const String TOP = 'top-headlines';
// const String TOKEN = '5920fbb42d194ec9be1500b5094ed123';

// class Api {
//   Future<List<Article>> getInitialArticle() async {
//     var client = new http.Client();
//     final response =
//       await client.get(_buildUrl(TOP));
//       return await compute(_parseArticle, response.body);
//   }
//   Future<List<Article>> getArticles() async {
//     var client = new http.Client();
//     final response = await client.get(_buildUrl(TOP));

//     return await compute(_parseArticle, response.body);
//   }
//   static List<Article> _parseArticle(String responseBody) {
//     final parsed = json.decode(responseBody);
//     return parsed['articles'].map<Article>((json) => Article.fromJson(json)).toList();
//   }
//   _buildUrl(String endpoint) {
//     return '$API$endpoint?country=it&apiKey=$TOKEN';
//   }
// }

import 'dart:convert';

import 'package:coolapp/models/article.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  static final String _apiKey = '21262fa8dec0458a8d2e3b53d5719446';


  String _getNewsUrl({sort = 'publishedAt'}) => 'http://newsapi.org/v2/everything?q=bitcoin&from=2020-03-10&sortBy=$sort&apiKey=$_apiKey';


  Future<List<Article>> getArticles(context) async {
    var client = http.Client();
    final response = await client.get(this._getNewsUrl());

    print(response.body);

    return await compute(_parseArticle, response.body);
  }

  /*
   * Per quando riuscirò a far funzionare il refresh :D
   * 
    Future<void> getArticles(context) async {
      ArticlesHolder tmp = Provider.of<ArticlesHolder>(context);
      http.Client client = http.Client();
      http.Response response = await client.get(this._getNewsUrl());
      
      tmp.articles = await compute(_parseArticle, response.body);
    }
  */

  static List<Article> _parseArticle(String responseBody) {
    final parsed = json.decode(responseBody);

    return parsed['articles'].map<Article>((json) => Article.fromJson(json)).toList();
  }



}
