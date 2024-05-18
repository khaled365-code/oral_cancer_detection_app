import 'Post.dart';
import 'Comments.dart';
import 'PostwriterData.dart';

/// post : {"id":1,"user_id":1,"image":"https://via.placeholder.com/640x480.png/00aa22?text=quia","title":"Ratione dolorem esse qui magni ex corrupti.","slug":"qui-in-eos-dolorem","body":"Est sunt aut qui in. Repellat aliquid quia et. Temporibus dolorem impedit quia dolores rerum ex. Maiores officia ea non provident reiciendis rem explicabo. Magni quos et laudantium aut. Dolor ut doloremque eum officiis. Repellat voluptas quae quo deleniti soluta voluptatem qui.","published_at":"2024-04-30T17:52:58.000000Z","featured":0,"deleted_at":null,"created_at":"2024-05-03T14:17:18.000000Z","updated_at":"2024-05-03T14:17:18.000000Z"}
/// comments : [{"id":2,"user_id":103,"post_id":1,"comment":"comment from khaled mohamed","created_at":"2024-05-09T05:05:42.000000Z","updated_at":"2024-05-09T05:05:42.000000Z"}]
/// like_count : 0
/// comment_count : 1
/// postwriter_data : {"name":"Reymundo Hauck","email":"arnold.boyle@example.net","profile_photo_path":null,"profile_photo_url":"https://ui-avatars.com/api/?name=R+H&color=7F9CF5&background=EBF4FF"}

class OnePostData {
  OnePostData({
      this.post, 
      this.comments, 
      this.likeCount, 
      this.commentCount, 
      this.postwriterData,});

  OnePostData.fromJson(dynamic json) {
    post = json['post'] != null ? OnePostPostDetails.fromJson(json['post']) : null;
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(OnePostCommentsModel.fromJson(v));
      });
    }
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    postwriterData = json['postwriter_data'] != null ? PostwriterData.fromJson(json['postwriter_data']) : null;
  }
  OnePostPostDetails? post;
  List<OnePostCommentsModel>? comments;
  num? likeCount;
  num? commentCount;
  PostwriterData? postwriterData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (post != null) {
      map['post'] = post?.toJson();
    }
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    map['like_count'] = likeCount;
    map['comment_count'] = commentCount;
    if (postwriterData != null) {
      map['postwriter_data'] = postwriterData?.toJson();
    }
    return map;
  }

}