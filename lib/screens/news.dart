// import 'package:coolapp/components/cardNews.dart';
// import 'package:coolapp/models/article.dart';
// import 'package:coolapp/components/cardNews.dart';
// import 'package:coolapp/models/articlesHolder.dart';
import 'package:coolapp/components/cardNews.dart';
import 'package:coolapp/models/article.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import 'package:coolapp/main.dart';

class News extends StatefulWidget {
  News() : super();

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: CategoriesEnum.values.length, vsync: this);
    _tabController.addListener(_handleTabSelection);

    final bloc = Provider.of<NewsBloc>(context, listen: false);
    bloc.getNews();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWS",
          style: Theme.of(context).textTheme.headline1,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(12.0),
          child: StreamBuilder<AppScreen>(
            stream: bloc.actualScreen,
            builder: (context, AsyncSnapshot<AppScreen> snapshot) {
              return topBar(snapshot.data);
            },
          ),
        ),
      ),
      body: NewsList(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Notizie'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Preferiti'),
          ),
        ],
        onTap: (index) => bloc.changeScreen(index),
      ),
    ));
  }

  void _handleTabSelection() async {
    if (!_tabController.indexIsChanging) {
      final bloc = Provider.of<NewsBloc>(context, listen: false);
      bloc.changeCategory(_tabController.index);
    } else
      print("Tab is switching..from active to inactive");
  }

  get categories => CategoriesEnum.values
      .map((e) => Tab(text: categoryName(e).toUpperCase()))
      .toList();

  Widget topBar(AppScreen appScreen) {
    switch (appScreen) {
      case AppScreen.favorites:
        return Container();
      case AppScreen.main:
      default:
        return TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          tabs: categories,
          controller: _tabController,
        );
    }
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context);
    return Center(
      child: StreamBuilder<List<Article>>(
        stream: bloc.articles,
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, position) => CardNews(snapshot.data[position]),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

// class News extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 text: 'Top news',
//               ),
//               Tab(
//                 text: 'Technology',
//               ),
//             ],
//           ),
//           title: Text('News App'),
//         ),
//         body: Consumer<ArticlesHolder>(
//           builder: (context, news, child) {
//             return RefreshIndicator(
//               onRefresh: () async => {},
//               child: TabBarView(
//                 children: [
//                   ListView.builder( itemCount: news.topNews.length, itemBuilder: (context, position) => CardNews(news.topNews[position])),
//                   ListView.builder( itemCount: news.tecnologyNews.length, itemBuilder: (context, position) => CardNews(news.tecnologyNews[position])),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );

//     /* return Scaffold(
//       appBar: AppBar(
//         title: Text('Newz!'),
//         bottom: TabBar(
//           tabs: <Widget>[

//           ],
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: RefreshIndicator(
//             onRefresh: () async {
//               print('Work in progress :D');
//             },
//             child: null
//             // child: Consumer <ArticlesHolder> (
//             //   builder: (context, news, child) {
//             //     return ListView.builder(
//             //       itemCount: news.articles.length,
//             //       itemBuilder: (context, position) => CardNews(news.articles[position]));
//             //     }
//             // )
//           ),

//         )
//       )
//     );
//     */
//   }
// }
