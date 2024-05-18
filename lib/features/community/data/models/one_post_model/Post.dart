/// id : 1
/// user_id : 1
/// image : "https://via.placeholder.com/640x480.png/00aa22?text=quia"
/// title : "Ratione dolorem esse qui magni ex corrupti."
/// slug : "qui-in-eos-dolorem"
/// body : "Est sunt aut qui in. Repellat aliquid quia et. Temporibus dolorem impedit quia dolores rerum ex. Maiores officia ea non provident reiciendis rem explicabo. Magni quos et laudantium aut. Dolor ut doloremque eum officiis. Repellat voluptas quae quo deleniti soluta voluptatem qui."
/// published_at : "2024-04-30T17:52:58.000000Z"
/// featured : 0
/// deleted_at : null
/// created_at : "2024-05-03T14:17:18.000000Z"
/// updated_at : "2024-05-03T14:17:18.000000Z"

class OnePostPostDetails {
  OnePostPostDetails({
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

  OnePostPostDetails.fromJson(dynamic json) {
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