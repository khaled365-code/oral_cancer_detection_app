import 'Source.dart';

/// source : {"id":null,"name":"[Removed]"}
/// author : null
/// title : "[Removed]"
/// description : "[Removed]"
/// url : "https://removed.com"
/// urlToImage : null
/// publishedAt : "1970-01-01T00:00:00Z"
/// content : "[Removed]"

class TopArticles {
  TopArticles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  TopArticles.fromJson(dynamic json) {
    source = json['source'] != null ? TopHeadLinesSources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  TopHeadLinesSources? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}