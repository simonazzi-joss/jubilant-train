import 'dart:async';

import 'package:coolapp/models/article.dart';
import 'package:coolapp/screens/bimby.dart';
import 'package:coolapp/screens/bimbyAoo.dart';
import 'package:coolapp/screens/esercitazione2.dart';
import 'package:coolapp/screens/googleMapsEx.dart';
import 'package:coolapp/screens/news.dart';
import 'package:coolapp/screens/testAnimation.dart';
import 'package:coolapp/services/dbRepo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/api.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

const String NewsBox = 'NewsBox';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ArticleAdapter());

  await Hive.openBox<Article>(NewsBox);
  await Hive.openBox<Article>('pippo');

  GoogleMap.init('AIzaSyDxHs6r4FXyr3P1bF4ZqNO2ZdOSXQc7WzM');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        Provider<NewsBloc>(create: (_) => NewsBloc()),
      ],
      child: MaterialApp(
        title: 'Definitely not GoogleNews',
        theme: appTheme,
        initialRoute: '/bimby',
        routes: {
          '/': (context) => News(),
          '/search': (context) => null,
          // '/stack': (context) => StackExample(),
          '/animation': (context) => TestAnimations(),
          '/bimbyExample': (context) => Bimby(title: ':D'),
          '/todoExambple': (context) => TodoHomeOnePage(),
          '/googleExample': (context) => GoogleMapsEx(),
          '/bimby': (context) => BimbyApp(),
        },
      ),
    );
  }
}

enum AppScreen { main, favorites }

enum CategoriesEnum {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

String categoryName(CategoriesEnum category) =>
    category.toString().split('.').last;

class NewsBloc {
  final Api _repository = Api();
  final DbRepository _dbRepository = DbRepository();

  CategoriesEnum _actualCategory = CategoriesEnum.general;
  AppScreen _actualScreen = AppScreen.main;

  //Streams
  Stream<List<Article>> get articles => _articles.stream;
  Stream<CategoriesEnum> get actualCategory => _screenController.stream;
  Stream<AppScreen> get actualScreen => _actualScreenController.stream;

  final StreamController<CategoriesEnum> _screenController =
      StreamController<CategoriesEnum>.broadcast();
  final StreamController<List<Article>> _articles =
      StreamController<List<Article>>.broadcast();
  final StreamController<AppScreen> _actualScreenController =
      StreamController<AppScreen>.broadcast();

  NewsBloc() {
    Hive.box<Article>(NewsBox).watch().forEach((element) {
      print(element.toString());
      _manageArticles();
    });
  }

  changeCategory(int index) {
    _actualCategory = CategoriesEnum.values[index];
    _articles.sink.add(null); //Clear news
    _screenController.sink.add(_actualCategory);
    getNews();
  }

  changeScreen(int index) {
    _actualScreen = AppScreen.values[index];
    _actualScreenController.sink.add(_actualScreen);
    _manageArticles();
  }

  _manageArticles() {
    if (AppScreen.favorites == _actualScreen)
      _articles.sink.add(_dbRepository.getArticles());
    else
      getNews();
  }

  getNews() async {
    List<Article> response =
        await _repository.getArticles(categoryName(_actualCategory));
    _articles.sink.add(response);
  }

  dispose() {
    _screenController?.close();
    _articles?.close();
    _actualScreenController?.close();
  }
}
