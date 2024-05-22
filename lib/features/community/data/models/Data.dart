import 'Post.dart';
import 'Userdata.dart';

/// post : {"id":1,"user_id":1,"image":"https://via.placeholder.com/640x480.png/00aa22?text=quia","title":"Ratione dolorem esse qui magni ex corrupti.","slug":"qui-in-eos-dolorem","body":"Est sunt aut qui in. Repellat aliquid quia et. Temporibus dolorem impedit quia dolores rerum ex. Maiores officia ea non provident reiciendis rem explicabo. Magni quos et laudantium aut. Dolor ut doloremque eum officiis. Repellat voluptas quae quo deleniti soluta voluptatem qui.","published_at":"2024-04-30T17:52:58.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-03T14:17:18.000000Z","updated_at":"2024-05-03T14:17:18.000000Z"}
/// comment_count : 0
/// like_count : 0
/// userdata : {"name":"Reymundo Hauck","email":"arnold.boyle@example.net","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=R+H&color=7F9CF5&background=EBF4FF"}

class Data {
  Data({
      this.post, 
      this.commentCount, 
      this.likeCount, 
      this.userdata,});

  Data.fromJson(dynamic json) {
    post = json['post'] != null ? Post.fromJson(json['post']) : null;
    commentCount = json['comment_count'];
    likeCount = json['like_count'];
    userdata = json['userdata'] != null ? Userdata.fromJson(json['userdata']) : null;
  }
  Post? post;
  num? commentCount;
  num? likeCount;
  Userdata? userdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (post != null) {
      map['post'] = post?.toJson();
    }
    map['comment_count'] = commentCount;
    map['like_count'] = likeCount;
    if (userdata != null) {
      map['userdata'] = userdata?.toJson();
    }
    return map;
  }

}