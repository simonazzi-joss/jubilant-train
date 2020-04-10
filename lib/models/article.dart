
class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        json['author'] as String,
        json['title'] as String,
        json['description'] as String,
        json['url'] as String,
        json['urlToImage'] as String,
        json['publishedAt'] as String,
        json['content'] as String,
    );
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