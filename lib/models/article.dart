
import 'dart:convert';

import 'package:flutter/semantics.dart';
import 'package:hive/hive.dart';
import 'package:crypto/crypto.dart';

@HiveType(typeId: 0)
class Article extends HiveObject{
  @HiveField(0) final String id;
  @HiveField(1) final String author;
  @HiveField(2) final String title;
  @HiveField(3) final String description;
  @HiveField(4) final String url;
  @HiveField(5) final String urlToImage;
  @HiveField(6) final String publishedAt;
  @HiveField(7) final String content;

  Article(this.id, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        toMd5(json['url']),
        json['author'] as String,
        json['title'] as String,
        json['description'] as String,
        json['url'] as String,
        json['urlToImage'] as String,
        json['publishedAt'] as String,
        json['content'] as String,
    );
  }

  static String toMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}

/*
  "source": {
    "id": "the-next-web",
    "name": "The Next Web"
  },
  "author": "Satoshi Nakaboto",
  "title": "Satoshi Nakaboto: 'New Visa-powered credit card pays rewards in Bitcoin'",
  "description": "Our robot colleague Satoshi Nakaboto writes about Bitcoin every fucking day. Welcome to another edition of Bitcoin Today, where I, Satoshi Nakaboto, tell you what’s been going on with Bitcoin in the past 24 hours. As Foucault used to say: There’s only one way…",
  "url": "https://thenextweb.com/hardfork/2020/04/10/satoshi-nakaboto-new-visa-powered-credit-card-pays-rewards-in-bitcoin/",
  "urlToImage": "https://img-cdn.tnwcdn.com/image/hardfork?filter_last=1&fit=1280%2C640&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2019%2F08%2Fbitcoin_today-header_bitcoin_today.jpg&signature=30221b6a68049cc6bc3b58f3ddb38864",
  "publishedAt": "2020-04-10T09:08:30Z",
  "content": "Our robot colleague Satoshi Nakaboto writes about Bitcoin BTC every fucking day.\r\nWelcome to another edition of Bitcoin Today, where I, Satoshi Nakaboto, tell you whats been going on with Bitcoin in the past 24 hours. As Foucault used to say: Theres only one … [+2946 chars]"
  }
*/

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  Article read(BinaryReader reader) {
      return Article(
        reader.read(),
        reader.read(),
        reader.read(),
        reader.read(),
        reader.read(),
        reader.read(),
        reader.read(),
        reader.read(),
      );
    }
  
    @override
    int get typeId => 0;
  
    void write(BinaryWriter writer, Article obj) {
      writer.write(obj.id);
      writer.write(obj.author);
      writer.write(obj.title);
      writer.write(obj.description);
      writer.write(obj.url);
      writer.write(obj.urlToImage);
      writer.write(obj.publishedAt);
      // writer.write(obj.source);
    }
  
}