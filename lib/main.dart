import 'package:coolapp/screens/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'models/articlesHolder.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return ChangeNotifierProvider(
      create: (context) => ArticlesHolder(),
      child: MaterialApp(
        title: 'tittle',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => News(),
        },
      )
    );
  }
}
