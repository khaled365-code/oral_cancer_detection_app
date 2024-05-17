import 'Message.dart';

/// message : {"comments":[{"comment":{"id":4,"user_id":103,"post_id":117,"comment":"Good mr khaled","created_at":"2024-05-11T10:10:44.000000Z","updated_at":"2024-05-11T10:10:44.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}},{"comment":{"id":5,"user_id":103,"post_id":117,"comment":"Good mr khaled","created_at":"2024-05-11T10:14:21.000000Z","updated_at":"2024-05-11T10:14:21.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}},{"comment":{"id":6,"user_id":103,"post_id":117,"comment":"I am testing comment Function","created_at":"2024-05-11T10:16:24.000000Z","updated_at":"2024-05-11T10:16:24.000000Z"},"userdata":{"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}}],"likedByThisUser":0}
/// status : 200

class GetCommentsModel {
  GetCommentsModel({
      this.message, 
      this.status,});

  GetCommentsModel.fromJson(dynamic json) {
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    status = json['status'];
  }
  Message? message;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message?.toJson();
    }
    map['status'] = status;
    return map;
  }

}