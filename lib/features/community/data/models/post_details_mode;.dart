

// import 'package:graduation_project/core/api/api_endPoints.dart';
// import 'package:image_picker/image_picker.dart';
//
// class PostDetailsModel
// {
//   final String? postImage;
//   final String body;
//   final DateTime createdAt;
//   final int userId;
//   final int postId;
//   final int commentCount;
//   final int likeCount;
//   final String postOwnerName;
//   final String ownerEmail;
//   final String ownerPhoto;
//   final List<dynamic> dataList;
//
//
//
//
//   factory  PostDetailsModel.fromJson(json)
//   {
//     return PostDetailsModel(
//       dataList: json['data'],
//       postImage: json['data']['post'][ApiKeys.image] ,
//       body: json['data']['post'][ApiKeys.body],
//       createdAt: json['data']['post'][ApiKeys.created_at],
//       userId: json['data']['post'][ApiKeys.user_id] ,
//       postId: json['data']['post'][ApiKeys.id],
//       commentCount: json['data'][ApiKeys.comment_count],
//       likeCount:  json['data'][ApiKeys.like_count],
//       ownerEmail: json['data']['userdata'][ApiKeys.email],
//       ownerPhoto: json['data']['userdata'][ApiKeys.profile_photo_url],
//       postOwnerName:  json['data']['userdata'][ApiKeys.name],
//     );
//
//
//   }
//
//   PostDetailsModel({required this.dataList,this.postImage, required this.body, required this.createdAt, required this.userId, required this.postId, required this.commentCount, required this.likeCount, required this.postOwnerName, required this.ownerEmail, required this.ownerPhoto});
//
//
// }