import 'package:coolapp/models/article.dart';
import 'package:flutter/material.dart';

class CardNews extends StatelessWidget {
  final Article newsData;

  CardNews(this.newsData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(this.newsData.title),
            ),
            padding: EdgeInsets.all(5),
          ),
          Container(
            child: _buildCardContent(),
            padding: EdgeInsets.all(5),
          ),
          Container(
            child: this.newsData.author != null ? Text(this.newsData.author) : Text('No Author available'),
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    if (this.newsData.urlToImage != null) {
      return Image.network(this.newsData.urlToImage);
    } 
    if (this.newsData.description != null) {
      return Text(this.newsData.description);
    }
    return Text('NO DATA AVAILABLE');
  }
}
