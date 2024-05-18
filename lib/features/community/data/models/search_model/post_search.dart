/// id : 103
/// user_id : 103
/// image : "public/images/IUMRs2SPA8UTSeiLwaxtJ3IZMK5kOWNRLVM8VG1g.png"
/// title : "oralcan"
/// slug : "oralcan"
/// body : "hello it is me khaled i am Software Engineer"
/// published_at : "2024-05-09T08:06:10.000000Z"
/// featured : 0
/// deleted_at : null
/// created_at : "2024-05-09T08:06:10.000000Z"
/// updated_at : "2024-05-09T08:06:10.000000Z"

class PostSearch {
  PostSearch({
      this.id, 
      this.userId, 
      this.image, 
      this.title, 
      this.slug, 
      this.body, 
      this.publishedAt, 
      this.featured, 
      this.deletedAt, 
      this.createdAt, 
      this.updatedAt,});

  PostSearch.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    slug = json['slug'];
    body = json['body'];
    publishedAt = json['published_at'];
    featured = json['featured'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  String? image;
  String? title;
  String? slug;
  String? body;
  String? publishedAt;
  num? featured;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['image'] = image;
    map['title'] = title;
    map['slug'] = slug;
    map['body'] = body;
    map['published_at'] = publishedAt;
    map['featured'] = featured;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}