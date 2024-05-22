import 'Comment.dart';
import 'Userdata.dart';

/// comment : {"id":4,"user_id":103,"post_id":117,"comment":"Good mr khaled","created_at":"2024-05-11T10:10:44.000000Z","updated_at":"2024-05-11T10:10:44.000000Z"}
/// userdata : {"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}

class Comments {
  Comments({
      this.comment, 
      this.userdata,});

  Comments.fromJson(dynamic json) {
    comment = json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    userdata = json['userdata'] != null ? Userdata.fromJson(json['userdata']) : null;
  }
  Comment? comment;
  Userdata? userdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (comment != null) {
      map['comment'] = comment?.toJson();
    }
    if (userdata != null) {
      map['userdata'] = userdata?.toJson();
    }
    return map;
  }

}