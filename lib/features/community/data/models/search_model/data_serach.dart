import 'post_search.dart';
import 'userdata_search.dart';

/// post : {"id":103,"user_id":103,"image":"public/images/IUMRs2SPA8UTSeiLwaxtJ3IZMK5kOWNRLVM8VG1g.png","title":"oralcan","slug":"oralcan","body":"hello it is me khaled i am Software Engineer","published_at":"2024-05-09T08:06:10.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-09T08:06:10.000000Z","updated_at":"2024-05-09T08:06:10.000000Z"}
/// userdata : {"name":"khaled","email":"khaledmokhaled123@gmail.com","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=k&color=7F9CF5&background=EBF4FF"}
/// comment_count : 0
/// like_count : 0

class DataSearch {
  DataSearch({
      this.post, 
      this.userdata, 
      this.commentCount, 
      this.likeCount,});

  DataSearch.fromJson(dynamic json) {
    post = json['post'] != null ? PostSearch.fromJson(json['post']) : null;
    userdata = json['userdata'] != null ? UserdataSearch.fromJson(json['userdata']) : null;
    commentCount = json['comment_count'];
    likeCount = json['like_count'];
  }
  PostSearch? post;
  UserdataSearch? userdata;
  num? commentCount;
  num? likeCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (post != null) {
      map['post'] = post?.toJson();
    }
    if (userdata != null) {
      map['userdata'] = userdata?.toJson();
    }
    map['comment_count'] = commentCount;
    map['like_count'] = likeCount;
    return map;
  }

}