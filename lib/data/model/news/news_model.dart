import 'dart:convert';

List<NewsArticle> newsArticleFromJson(String str) => List<NewsArticle>.from(json
    .decode(str)['articles']
    .map((x) => NewsArticle.fromJson(Map<String, dynamic>.from(x))));

class NewsArticle {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String urlToImage;
  DateTime? publishedAt;
  String? content;

  NewsArticle({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    required this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class Source {
  dynamic id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
