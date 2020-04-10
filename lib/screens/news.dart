// import 'package:coolapp/components/cardNews.dart';
// import 'package:coolapp/models/article.dart';
import 'package:coolapp/components/cardNews.dart';
import 'package:coolapp/models/articlesHolder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// import '../models/articlesHolder.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: Consumer<ArticlesHolder>(
          builder: (context, news, child) {
            return RefreshIndicator(
              onRefresh: () async => news.refresh(context),
              child: TabBarView(
                children: [
                  ListView.builder( itemCount: news.articles.length, itemBuilder: (context, position) => CardNews(news.articles[position])), 
                  ListView.builder( itemCount: news.articles.length, itemBuilder: (context, position) => CardNews(news.articles[position])), 
                ],
              ),
            );
          },
        ),
      ),
    );

    /* return Scaffold(
      appBar: AppBar(
        title: Text('Newz!'),
        bottom: TabBar(
          tabs: <Widget>[

          ],
        ),
      ),
      body: Container(
        child: Center(
          child: RefreshIndicator(
            onRefresh: () async { 
              print('Work in progress :D');
            },
            child: null
            // child: Consumer <ArticlesHolder> (
            //   builder: (context, news, child) {
            //     return ListView.builder(
            //       itemCount: news.articles.length,
            //       itemBuilder: (context, position) => CardNews(news.articles[position]));
            //     }
            // )
          ),

        )
      )
    );
    */
  }
}
