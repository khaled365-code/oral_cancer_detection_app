import 'Comments.dart';

/// comments : [{"comment":{"id":4,"user_id":103,"post_id":117,"comment":"Good mr khaled","created_at":"2024-05-11T10:10:44.000000Z","updated_at":"2024-05-11T10:10:44.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}},{"comment":{"id":5,"user_id":103,"post_id":117,"comment":"Good mr khaled","created_at":"2024-05-11T10:14:21.000000Z","updated_at":"2024-05-11T10:14:21.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}},{"comment":{"id":6,"user_id":103,"post_id":117,"comment":"I am testing comment Function","created_at":"2024-05-11T10:16:24.000000Z","updated_at":"2024-05-11T10:16:24.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}}]
/// likedByThisUser : 0

class Message {
  Message({
      this.comments, 
      this.likedByThisUser,});

  Message.fromJson(dynamic json) {
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(Comments.fromJson(v));
      });
    }
    likedByThisUser = json['likedByThisUser'];
  }
  List<Comments>? comments;
  num? likedByThisUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    map['likedByThisUser'] = likedByThisUser;
    return map;
  }

}