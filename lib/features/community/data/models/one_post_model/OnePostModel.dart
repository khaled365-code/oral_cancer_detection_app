import 'one_post_data.dart';

/// data : {"post":{"id":1,"user_id":1,"image":"https://via.placeholder.com/640x480.png/00aa22?text=quia","title":"Ratione dolorem esse qui magni ex corrupti.","slug":"qui-in-eos-dolorem","body":"Est sunt aut qui in. Repellat aliquid quia et. Temporibus dolorem impedit quia dolores rerum ex. Maiores officia ea non provident reiciendis rem explicabo. Magni quos et laudantium aut. Dolor ut doloremque eum officiis. Repellat voluptas quae quo deleniti soluta voluptatem qui.","published_at":"2024-04-30T17:52:58.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-03T14:17:18.000000Z","updated_at":"2024-05-03T14:17:18.000000Z"},"comments":[{"id":2,"user_id":103,"post_id":1,"comment":"comment from khaled mohamed","created_at":"2024-05-09T05:05:42.000000Z","updated_at":"2024-05-09T05:05:42.000000Z"}],"like_count":0,"comment_count":1,"postwriter_data":{"name":"Reymundo Hauck","email":"arnold.boyle@example.net","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=R+H&color=7F9CF5&background=EBF4FF"}}
/// message : "ok"
/// status : 200

class OnePostModel {
  OnePostModel({
      this.data, 
      this.message, 
      this.status,});

  OnePostModel.fromJson(dynamic json) {
    data = json['data'] != null ? OnePostData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  OnePostData? data;
  String? message;
  num? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}