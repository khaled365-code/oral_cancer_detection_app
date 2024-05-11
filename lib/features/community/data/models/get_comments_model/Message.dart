/// id : 2
/// user_id : 103
/// post_id : 1
/// comment : "comment from khaled mohamed"
/// created_at : "2024-05-09T05:05:42.000000Z"
/// updated_at : "2024-05-09T05:05:42.000000Z"

class Message {
  Message({
      this.id, 
      this.userId, 
      this.postId, 
      this.comment, 
      this.createdAt, 
      this.updatedAt,});

  Message.fromJson(dynamic json) {
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