import 'package:coolapp/models/article.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class Api {
  static const String _apiKey = '21262fa8dec0458a8d2e3b53d5719446';
  static const String _API = 'http://newsapi.org/v2/';
  static const String _TOP = 'top-headlines';

  final Dio dio = Dio();
  final DioCacheManager dioCache = DioCacheManager(CacheConfig(baseUrl: _API));

  Api() {
    dio.options.baseUrl = _API;
    dio.options.connectTimeout = 5000;
    dio.transformer = FlutterTransformer();
    dio.interceptors.add(dioCache.interceptor);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      options.queryParameters['apiKey'] = _apiKey;
      options.queryParameters['country'] = 'it';

      if (options.extra.isNotEmpty) {
        options.queryParameters.addAll(options.extra);
      }

      return options;
    }, onResponse: (Response response) async {
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) async {
      // Do something with response error
      print(e);
      return e; //continue
    }));
  }

  Future<List<Article>> getArticles(
    String category,
  ) async {
    Response response = await dio.get(
      _TOP,
      options: this._createOptions(category: category, query: null),
    );

    return response.data['articles']
        .map<Article>((json) => Article.fromJson(json))
        .toList();
  }

  Options _createOptions({
    String category,
    String query,
  }) {
    Options options = buildCacheOptions(Duration(seconds: 30));

    if (category != null) {
      options.extra['category'] = category;
    }
    if (query != null) {
      options.extra['q'] = query;
    }

    return options;
  }
}
