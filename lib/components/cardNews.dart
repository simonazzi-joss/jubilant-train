import 'package:coolapp/models/article.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../main.dart';

class CardNews extends StatefulWidget {
  final Article article;

  CardNews(this.article, {Key key}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<CardNews> {
  Box<Article> favoriteBox;

  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onFavoritePress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LimitedBox(
                maxHeight: 300,
                child: Center(
                  child: kIsWeb
                      ? Image.network(
                          widget.article.urlToImage,
                          fit: BoxFit.fitWidth,
                        )
                      : CachedNetworkImage(
                          imageUrl: widget.article.urlToImage,
                          fit: BoxFit.fitWidth,
                          placeholder: (context, url) => center(
                            CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => center(
                            Icon(Icons.image),
                          ),
                        ),
                )),
            Text(widget.article.author != null ? widget.article.author : ""),
            const SizedBox(
              height: 8,
            ),
            Text(widget.article.title),
            const SizedBox(
              height: 8,
            ),
            Text(widget.article.publishedAt),
            getIcon(widget.article.id)
          ],
        ),
      ),
    );
  }

  Widget getIcon(String id) {
    if (favoriteBox.containsKey(id)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress() {
    if (favoriteBox.containsKey(widget.article.id)) {
      favoriteBox.delete(widget.article.id);
      return;
    }
    favoriteBox.put(widget.article.id, widget.article);
  }

  center(Widget widget) => Container(
        height: 200,
        color: Colors.grey[200],
        child: Center(child: widget),
      );
}

// class CardNews extends StatelessWidget {
//   final Article newsData;

//   CardNews(this.newsData);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: <Widget>[
//           Container(
//             child: Center(
//               child: Text(this.newsData.title),
//             ),
//             padding: EdgeInsets.all(5),
//           ),
//           Container(
//             child: _buildCardContent(),
//             padding: EdgeInsets.all(5),
//           ),
//           Container(
//             child: this.newsData.author != null ? Text(this.newsData.author) : Text('No Author available'),
//             padding: EdgeInsets.all(5),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCardContent() {
//     if (this.newsData.urlToImage != null) {
//       return Image.network(this.newsData.urlToImage);
//     }
//     if (this.newsData.description != null) {
//       return Text(this.newsData.description);
//     }
//     return Text('NO DATA AVAILABLE');
//   }
// }
