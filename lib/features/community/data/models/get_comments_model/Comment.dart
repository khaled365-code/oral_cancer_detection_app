/// id : 4
/// user_id : 103
/// post_id : 117
/// comment : "Good mr khaled"
/// created_at : "2024-05-11T10:10:44.000000Z"
/// updated_at : "2024-05-11T10:10:44.000000Z"

class Comment {
  Comment({
      this.id, 
      this.userId, 
      this.postId, 
      this.comment, 
      this.createdAt, 
      this.updatedAt,});

  Comment.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  num? postId;
  String? comment;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['post_id'] = postId;
    map['comment'] = comment;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}